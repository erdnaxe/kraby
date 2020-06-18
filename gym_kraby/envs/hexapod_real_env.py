import numpy as np
import gym
from gym import spaces
from ..utils.herkulex_socket import HerkulexSocket


class HexapodRealEnv(gym.Env):
    """Hexapod environnement for transfer to real robot"""
    metadata = {'render.modes': ['human']}

    def __init__(self, max_step=1000, render=False):
        """Init environment"""
        super().__init__()
        self.servomotors = HerkulexSocket()

        # 18 actions (servomotors)
        self.n_actions = 18
        self.action_space = spaces.Box(low=-1, high=1,
                                       shape=(self.n_actions,),
                                       dtype="float32")

        # 18*(position,speed,torque) + robot positions observations
        self.n_observation = 3*18+6
        self.observation_space = spaces.Box(low=-1, high=1,
                                            shape=(self.n_observation,),
                                            dtype="float32")

        # Init observation space
        self.observation = np.zeros(self.n_observation, dtype="float32")

        # Change timestep according to datarate
        self.dt = 0.01  # TODO

        # Environment max step
        self.counting_step = 0
        self.max_step = max_step

        # Some constants for normalization
        self.servo_max_speed = 6.308  # rad/s
        self.servo_max_torque = 1.57  # N.m

        # Goal
        self.goal_position = np.array([1., 0., 0.1])

    def reset(self):
        self.servomotors.reset()

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
        Render environment
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
        TODO: take into account the inclinaison of base
        """
        # Has fallen?
        fallen = self.observation[-4] < 0.08

        # Distance progress toward goal
        goal_distance = np.linalg.norm(self.observation[-6:-3] - self.goal_position)**2

        # Comsuption is speed * torque
        speeds = self.observation[1:-6:3]
        torques = self.observation[2:-6:3]
        comsuption = self.dt * abs(sum(speeds * torques))
        w = 0.008  # comsuption weight

        # Compute reward
        # +200 to keep it positiv,
        # else the agent will learn how to end the episode quickly
        # 200 > max_comsuption + max_distance
        reward = 200 - goal_distance - w * comsuption
        done = fallen or self.counting_step > self.max_step
        return reward, done

    def _update_observation(self):
        """
        Update the observation from sensors
        """
        # Each servomotor position, speed and torque
        positions, speeds = self.servomotors.get_observations()

        # Robot position and orientation
        # TODO

        return positions
