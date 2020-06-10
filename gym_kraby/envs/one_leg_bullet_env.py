import pybullet as p
import numpy as np
import gym
import importlib.resources
from gym import spaces
from pybullet_data import getDataPath
from time import sleep


class OneLegBulletEnv(gym.Env):
    """One leg Hexapod environnement using PyBullet"""
    metadata = {'render.modes': ['human']}

    def __init__(self, time_step=0.01, render=False):
        """Init environment"""
        super().__init__()

        # Init PyBullet in GUI or DIRECT mode
        self.render = render
        if self.render:
            cid = p.connect(p.SHARED_MEMORY)
            if (cid < 0):
                cid = p.connect(p.GUI)
        else:
            p.connect(p.DIRECT)

        # 3 actions (servomotors)
        self.n_actions = 3
        self.action_space = spaces.Box(low=-1, high=1,
                                       shape=(self.n_actions,),
                                       dtype="float32")

        # 3*(position,speed,torque) + robot positions observations
        self.n_observation = 3*3+6
        self.observation_space = spaces.Box(low=-1, high=1,
                                            shape=(self.n_observation,),
                                            dtype="float32")

        # Init observation space
        self.observation = np.zeros(self.n_observation, dtype="float32")

        # Add pybullet_data as search path
        p.setAdditionalSearchPath(getDataPath())

        # Change simulation timestep
        self.dt = time_step
        p.setTimeStep(time_step)

        # Some constants for normalization
        self.servo_max_speed = 6.308  # rad/s
        self.servo_max_torque = 1.57  # N.m

        # Goal and last distance
        self.goal_position = [0.264, 0.016, 0.285]
        self.last_goal_distance = None

        # Seed random number generator
        self.seed()

    def reset(self):
        p.resetSimulation()

        # Newton's apple
        p.setGravity(0, 0, -9.81)

        # Load a ground
        p.loadURDF("plane.urdf")

        # Load robot
        flags = p.URDF_USE_SELF_COLLISION | p.URDF_USE_INERTIA_FROM_FILE
        #flags |= p.URDF_MERGE_FIXED_LINKS  # pybullet>2.89
        #flags |= p.URDF_IGNORE_VISUAL_SHAPES  # pybullet>2.89, see collisions
        with importlib.resources.path("gym_kraby", "data") as path:
            self.robot_id = p.loadURDF(str(path / 'one_leg.urdf'), flags=flags,
                                       useFixedBase=True)

        # Get all motorized joints id and name (which are revolute joints)
        self.joint_list = [j for j in range(p.getNumJoints(self.robot_id))
                           if p.getJointInfo(self.robot_id, j)[2] == p.JOINT_REVOLUTE]

        # Reset all joint using normal distribution
        m = np.pi/4
        for j in self.joint_list:
            p.resetJointState(self.robot_id, j, np.random.uniform(low=-m, high=m))

        # Return observation
        self._update_observation()
        return self.observation

    def step(self, action):
        # Update servomotors
        transformed_action = np.array(action) * self.servo_max_speed
        max_torques = [self.servo_max_torque] * self.n_actions
        p.setJointMotorControlArray(bodyIndex=self.robot_id,
                                    jointIndices=self.joint_list,
                                    controlMode=p.VELOCITY_CONTROL,
                                    targetVelocities=transformed_action,
                                    forces=max_torques)

        # Step simulation
        p.stepSimulation()  # step self.dt
        if self.render:
            sleep(self.dt)  # realtime

        # Return observation, reward and done
        self._update_observation()
        reward, done = self._get_reward()
        return self.observation, reward, done, {}

    def render(self, mode='human', close=False):
        """
        Do nothing as PyBullet automatically renders
        """
        pass

    def close(self):
        """
        Close running environment
        """
        p.disconnect()

    def seed(self, seed=None):
        """
        Sets the seed for this env's random number generator
        """
        np.random.seed(seed)

    def _get_reward(self):
        """
        Compute reward function
        """
        # Distance progress toward goal
        goal_distance = np.linalg.norm(self.observation[-6:-3] - self.goal_position)
        if self.last_goal_distance is None:
            distance_progress = 0
        else:
            distance_progress = self.last_goal_distance - goal_distance
        self.last_goal_distance = goal_distance

        # Comsuption is speed * torque
        comsuption = self.dt * abs(sum(self.observation[1:-6:3] * self.observation[2:-6:3]))
        w = 0.008  # comsuption weight

        # Compute reward
        reward = distance_progress - w * comsuption
        done = goal_distance < 0.001  # done if <1mm of target
        return reward, done

    def _update_observation(self):
        """
        Update the observation from BulletPhysics
        """
        # Each servomotor position, speed and torque
        all_states = p.getJointStates(self.robot_id, self.joint_list)
        for i, (pos, vel, _, tor) in enumerate(all_states):
            self.observation[3*i:3*i+3] = [
                2 * pos / np.pi,
                vel / self.servo_max_speed,
                tor / self.servo_max_torque
            ]

        # Sometimes 1.0 is greater than 1
        self.observation = np.clip(self.observation, -1., 1.)

        # Endcap position and orientation
        endcap_id = 5
        pos, ori, _, _, _, _ = p.getLinkState(self.robot_id, endcap_id)
        self.observation[-6:] = list(pos) + list(p.getEulerFromQuaternion(ori))

