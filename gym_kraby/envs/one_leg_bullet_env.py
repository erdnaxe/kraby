import pybullet as p
import numpy as np
import gym
from gym import spaces
from pybullet_data import getDataPath
from time import sleep
try:
    import importlib.resources as pkg_resources
except ImportError:
    # backported to python<3.7
    import importlib_resources as pkg_resources


class OneLegBulletEnv(gym.Env):
    """One leg Hexapod environnement using PyBullet"""
    metadata = {'render.modes': ['human']}

    def __init__(self, time_step=0.01, render=False, max_step=200):
        """Init environment"""
        super().__init__()

        # Init PyBullet in GUI or DIRECT mode
        self.render = render
        if self.render:
            # Try to connect to PyBullet render server
            cid = p.connect(p.SHARED_MEMORY)
            if (cid < 0):
                # Fail to connect, so launch a new server
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

        # Simulation timestep and max step
        self.dt = time_step
        p.setTimeStep(time_step)
        self.counting_step = 0
        self.max_step = max_step

        # Some constants for normalization
        self.servo_max_speed = 6.308  # rad/s
        self.servo_max_torque = 1.57  # N.m

        # Goal
        self.goal_position = np.array([0.264, 0.016, 0.285])

        # Seed random number generator
        self.seed()

    def reset(self):
        p.resetSimulation()
        self.counting_step = 0

        # Newton's apple
        p.setGravity(0, 0, -9.81)

        # Load a ground
        p.loadURDF("plane.urdf")

        # Load robot
        flags = p.URDF_USE_SELF_COLLISION | p.URDF_USE_INERTIA_FROM_FILE
        #flags |= p.URDF_MERGE_FIXED_LINKS  # pybullet>2.89
        #flags |= p.URDF_IGNORE_VISUAL_SHAPES  # pybullet>2.89, see collisions
        with pkg_resources.path("gym_kraby", "data") as path:
            self.robot_id = p.loadURDF(str(path / 'one_leg.urdf'), flags=flags,
                                       useFixedBase=True)

        # Get all motorized joints id and name (which are revolute joints)
        self.joint_list = [j for j in range(p.getNumJoints(self.robot_id))
                           if p.getJointInfo(self.robot_id, j)[2] == p.JOINT_REVOLUTE]

        # Reset all joint using normal distribution
        m = np.pi/4
        for j in self.joint_list:
            p.resetJointState(self.robot_id, j, np.random.uniform(low=-m, high=m))

        # Show goal as a crosshair
        if self.render:
            p.addUserDebugLine(self.goal_position - [0, 0, 0.01],
                            self.goal_position + [0, 0, 0.01], [0, 0, 0], 2)
            p.addUserDebugLine(self.goal_position - [0, 0.01, 0],
                            self.goal_position + [0, 0.01, 0], [0, 0, 0], 2)

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
        self.counting_step += 1
        p.stepSimulation()  # step self.dt
        if self.render:
            sleep(self.dt)  # realtime

        # Return observation, reward and done
        self._update_observation()
        reward, done = self._get_reward()
        return self.observation, reward, done, {}

    def render(self, mode='human', close=False):
        """
        Render environment
        Do nothing as PyBullet automatically renders
        """
        pass

    def close(self):
        """
        Close environment
        Do nothing as PyBullet automatically closes
        """
        pass

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
        goal_distance = np.linalg.norm(self.observation[-6:-3] - self.goal_position)**2

        # Comsuption is speed * torque
        speeds = self.observation[1:-6:3]
        torques = self.observation[2:-6:3]
        comsuption = self.dt * abs(sum(speeds * torques))
        w = 0.008  # comsuption weight

        # Compute reward
        reward = -goal_distance - w * comsuption
        done = self.counting_step > self.max_step
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
        self.observation[-3:] /= np.pi  # normalization
