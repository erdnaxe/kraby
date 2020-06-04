#!/usr/bin/env python3
import pybullet as p
import numpy as np
from pybullet_data import getDataPath
from gym import Env, spaces
from time import sleep


class HexapodBulletEnv(Env):
    """
    Hexapod simulation OpenAI Gym environnement using PyBullet
    """
    metadata = {'render.modes': ['human']}

    def __init__(self, time_step=0.01):
        super().__init__()

        # 18 actions (servomotors)
        self.nb_actions = 18
        high = np.ones([self.nb_actions])
        self.action_space = spaces.Box(-high, high)

        # 18*(position,speed,torque) + robot positions observations
        self.nb_observation = 3*18+6
        high = np.inf * np.ones([self.nb_observation])
        self.observation_space = spaces.Box(-high, high)

        # Add pybullet_data as search path
        p.setAdditionalSearchPath(getDataPath())

        # Change simulation timestep
        p.setTimeStep(time_step)

    def reset(self):
        p.resetSimulation()

        # Newton's apple
        p.setGravity(0, 0, -9.81)

        # Load a ground
        p.loadURDF("plane.urdf")

        # Load robot
        flags = p.URDF_USE_SELF_COLLISION | p.URDF_USE_INERTIA_FROM_FILE
        #flags |= p.URDF_MERGE_FIXED_LINKS  # only pybullet>2.89
        #flags |= p.URDF_IGNORE_VISUAL_SHAPES  # see collision shapes
        self.robot_id = p.loadURDF("hexapod.urdf", flags=flags)

        # Get all motorized joints id and name (which are revolute joints)
        self.joint_list = [j for j in range(p.getNumJoints(self.robot_id))
                           if p.getJointInfo(self.robot_id, j)[2] == p.JOINT_REVOLUTE]

        # Add torque sensor on servomotors
        for j in self.joint_list:
            p.enableJointForceTorqueSensor(self.robot_id, j)

        # Return observation
        observation = self.get_observation()
        return observation

    def step(self, action):
        # Update servomotors
        transformed_action = [k * np.pi/2 for k in action]
        p.setJointMotorControlArray(bodyIndex=self.robot_id,
                                    jointIndices=self.joint_list,
                                    controlMode=p.POSITION_CONTROL,
                                    targetPositions=transformed_action)

        # Step simulation
        p.stepSimulation()

        # Return observation, reward and done
        reward, done = self.get_reward()
        observation = self.get_observation()
        return observation, reward, done, {}

    def render(self, mode='human', close=False):
        pass

    def get_reward(self):
        """
        Compute reward function
        """
        # Get data
        fallen = self._has_fallen()
        #distance_to_goal =
        #comsuption =

        # Compute reward
        reward = 0  # TODO
        done = fallen or False  # TODO
        return reward, done

    def get_observation(self):
        """
        Get the observation from BulletPhysics
        """
        observation = np.zeros(self.nb_observation)

        # Each servomotor position, speed and torque
        all_states = p.getJointStates(self.robot_id, self.joint_list)
        for i, (pos, vel, _, tor) in enumerate(all_states):
            observation[3*i:3*i+3] = [pos, vel, tor]

        # Robot position and orientation
        pos, ori = p.getBasePositionAndOrientation(self.robot_id)
        observation[-6:] = list(pos) + list(p.getEulerFromQuaternion(ori))

        return observation

    def close(self):
        p.disconnect()

    def _has_fallen(self):
        """
        Return True when body touch the ground
        """
        pos, _ = p.getBasePositionAndOrientation(self.robot_id)
        return pos[-1] < 0.08


if __name__ == '__main__':
    # Connect to BulletPhysics GUI, can be DIRECT if no user inputs
    p.connect(p.GUI)
    env = HexapodBulletEnv()
    observation = env.reset()
    done = False

    # Create user debug interface
    params = [p.addUserDebugParameter(p.getJointInfo(env.robot_id, j)[1].decode(), -1, 1, 0)
              for j in env.joint_list]

    while not done:
        # Read user input and simulate motor
        a = [p.readUserDebugParameter(param) for param in params]
        observation, reward, done, _ = env.step(a)
        print("\nobservation", observation)
        print("reward", reward)
        print("done", done)
        sleep(0.01)

    print("[!] Robot has fallen")
