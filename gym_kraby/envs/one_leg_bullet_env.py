import pybullet as p
import numpy as np
import gym
import importlib.resources
from gym import error, spaces, utils
from gym.utils import seeding
from pybullet_data import getDataPath


class OneLegBulletEnv(gym.Env):
    """
    One leg of Hexapod environnement using PyBullet
    """
    metadata = {'render.modes': ['human']}

    def __init__(self, time_step=0.01):
        super().__init__()

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

        # Add pybullet_data as search path
        p.setAdditionalSearchPath(getDataPath())

        # Change simulation timestep
        p.setTimeStep(time_step)

        # Some constants for normalization
        self.servo_max_speed = 6.308  # rad/s
        self.servo_max_torque = 1.57  # N.m

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

        # Add torque sensor on servomotors
        # TODO: it might be deeply useless
        for j in self.joint_list:
            p.enableJointForceTorqueSensor(self.robot_id, j)

        # Return observation
        observation = self._get_observation()
        return observation

    def step(self, action):
        # Update servomotors
        transformed_action = action * np.array([0.46, 1.57, 1.57])
        # setJointMotorControlArray do not support maxVelocity
        # Use a small margin (0.99) to keep it in range of -1, 1
        for i in range(len(self.joint_list)):
            p.setJointMotorControl2(bodyIndex=self.robot_id,
                                    jointIndex=self.joint_list[i],
                                    controlMode=p.POSITION_CONTROL,  # TODO SPEED_CONTROL
                                    targetPosition=transformed_action[i],
                                    force=self.servo_max_torque,
                                    maxVelocity=self.servo_max_speed)

        # Step simulation
        p.stepSimulation()

        # Return observation, reward and done
        reward, done = self._get_reward()
        observation = self._get_observation()
        return observation, reward, done, {}

    def render(self, mode='human', close=False):
        """
        Do nothing as PyBullet automatically renders
        """
        pass

    def close(self):
        """
        OpenAIClose environment
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
        #distance_to_goal =
        #comsuption =

        # Compute reward
        reward = 0  # TODO
        done = False  # TODO
        return reward, done

    def _get_observation(self):
        """
        Get the observation from BulletPhysics
        """
        observation = np.zeros(self.n_observation, dtype="float32")

        # Each servomotor position, speed and torque
        all_states = p.getJointStates(self.robot_id, self.joint_list)
        for i, (pos, vel, _, tor) in enumerate(all_states):
            observation[3*i:3*i+3] = [
                2 * pos / np.pi,
                vel / self.servo_max_speed,
                tor / self.servo_max_torque
            ]

        # Sometimes 1.0 is greater than 1
        observation = np.clip(observation, -1., 1.)

        # Robot position and orientation
        pos, ori = p.getBasePositionAndOrientation(self.robot_id)
        observation[-6:] = list(pos) + list(p.getEulerFromQuaternion(ori))

        return observation

