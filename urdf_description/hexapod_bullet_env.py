#!/usr/bin/env python3
import pybullet as p
from pybullet_data import getDataPath
from gym import Env
from math import pi


class HexapodBulletEnv(Env):
    """
    Hexapod simulation OpenAI Gym environnement using PyBullet
    """
    metadata = {'render.modes': ['human']}

    def __init__(self):
        # Connect to Bullet GUI, can be DIRECT if no user inputs
        self.physics_client = p.connect(p.GUI)

        # Add pybullet_data as search path
        p.setAdditionalSearchPath(getDataPath())

    def reset(self):
        p.resetSimulation()

        # Newton's apple
        p.setGravity(0, 0, -9.81)

        # Load a ground
        p.loadURDF("plane.urdf")

        # Load robot
        flags = p.URDF_USE_SELF_COLLISION | p.URDF_MERGE_FIXED_LINKS | p.URDF_USE_INERTIA_FROM_FILE
        #flags |= p.URDF_IGNORE_VISUAL_SHAPES  # see collision shapes
        self.robot_id = p.loadURDF("hexapod.urdf", flags=flags)

        # Get all motorized joints id and name (which are revolute joints)
        self.joint_list = [j for j in range(p.getNumJoints(self.robot_id))
                           if p.getJointInfo(self.robot_id, j)[2] == p.JOINT_REVOLUTE]

        # Add torque sensor on servomotors
        for j in self.joint_list:
            p.enableJointForceTorqueSensor(self.robot_id, j)

    def step(self, action):
        # Update servomotors
        transformed_action = [k * pi/2 for k in action]
        p.setJointMotorControlArray(bodyIndex=self.robot_id,
                                    jointIndices=self.joint_list,
                                    controlMode=p.VELOCITY_CONTROL,
                                    targetVelocities=transformed_action)

        # Step simulation
        p.stepSimulation()

        # Return state, reward and done
        reward, done = self.get_reward()
        state = self.get_observation()
        return state, reward, done

    def render(self, mode='human', close=False):
        pass

    def get_reward(self):
        reward = 0
        done = False
        return reward, done

    def get_observation(self):
        observation = []
        return observation

    def terminate(self):
        p.disconnect()


if __name__ == '__main__':
    env = HexapodBulletEnv()
    env.reset()

    # Create user debug interface
    params = [p.addUserDebugParameter(p.getJointInfo(env.robot_id, j)[1].decode(), -1, 1, 0)
              for j in env.joint_list]

    while True:
        # Read user input and simulate motor
        a = [p.readUserDebugParameter(param) for param in params]
        env.step(a)
