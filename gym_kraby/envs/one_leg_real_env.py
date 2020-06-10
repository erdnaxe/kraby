import numpy as np
import gym
import importlib.resources
from gym import error, spaces, utils


class OneLegRealEnv(gym.Env):
    """
    One leg of Hexapod OpenAI Gym environnement for transfer to real robot
    """
    metadata = {'render.modes': ['human']}

    def __init__(self):
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

        # Init observation space
        self.observation = np.zeros(self.n_observation, dtype="float32")

        # Change timestep according to datarate
        self.dt = 0.01  # TODO

        # Some constants for normalization
        self.servo_max_speed = 6.308  # rad/s
        self.servo_max_torque = 1.57  # N.m

        # Goal and last distance
        self.goal_position = [0.264, 0.016, 0.285]
        self.last_goal_distance = None

    def reset(self):
        # TODO implement user prompt to put robot back in steady state

        # Get all motorized joints id and name (which are servomotors)
        self.joint_list = []  # TODO

        # Reset all joint using normal distribution
        m = np.pi/4
        for j in self.joint_list:
            pass
            # TODO move(self.robot_id, j, np.random.uniform(low=-m, high=m))

        # Return observation
        self._update_observation()
        return self.observation

    def step(self, action):
        # Update servomotors
        transformed_action = np.array(action) * self.servo_max_speed
        max_torques = [self.servo_max_torque] * self.n_actions
        # TODO send transformed_action and set max_torques

        # Return observation, reward and done
        self._update_observation()
        reward, done = self._get_reward()
        return self.observation, reward, done, {}

    def render(self, mode='human', close=False):
        """
        Do nothing as reality automatically renders
        """
        pass

    def close(self):
        """
        Close running environment
        """
        # TODO close robot connection

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
        Update the observation from sensors
        """
        # Each servomotor position, speed and torque
        # TODO

        # Robot position and orientation
        # TODO

