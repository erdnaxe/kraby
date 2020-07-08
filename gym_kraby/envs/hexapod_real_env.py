import numpy as np
import gym
from gym import spaces
from time import sleep
from ..utils.herkulex_socket import HerkulexSocket


class HexapodRealEnv(gym.Env):
    """Hexapod environnement for transfer to real robot
    """

    def __init__(self, time_step=0.01):
        """Init environment"""
        super().__init__()

        # 18 actions (servomotors)
        self.n_actions = 18
        self.action_space = spaces.Box(low=-1, high=1,
                                       shape=(self.n_actions,),
                                       dtype="float32")

        # 18*(position,speed) + imu + position target
        self.n_observation = 18*2+6+3
        self.observation_space = spaces.Box(low=-1, high=1,
                                            shape=(self.n_observation,),
                                            dtype="float32")
        self.observation = np.zeros(self.n_observation, dtype="float32")

        # Environment timestep and constants
        self.dt = time_step
        self.servo_max_speed = 6.308  # rad/s
        self.servo_max_torque = 1.57  # N.m

        # Seed random number generator
        self.seed()

        # Servomotors socket
        self.servomotors = HerkulexSocket(
            max_velocity=self.servo_max_speed,
            max_torque=self.servo_max_torque,
        )

    def reset(self):
        # Reset servomotors
        self.servomotors.reset()
        sleep(1)

        # Set random target and put it in observations
        self.target_position = np.array([1., 0., 0.1])  # FIXME: make it random
        self.observation[-3:] = self.target_position

        # Return observation
        self._update_observation()
        return self.observation

    def step(self, action):
        # Update servomotors
        transformed_action = np.array(action) * self.servo_max_speed
        transformed_action *= 0.01  # Training timestep
        self.servomotors.move(transformed_action)

        # Wait for environment step
        sleep(self.dt)

        # Return observation, reward and done
        self._update_observation()
        reward = 0  # No reward in real mode
        done = False
        return self.observation, reward, done, {}

    def close(self):
        """Stop servomotors torque"""
        self.servomotors.disableTorque()

    @staticmethod
    def seed(seed=None):
        """Sets the seed for this env's random number generator"""
        np.random.seed(seed)

    def _update_observation(self):
        """Update the observation from servomotors sensors and IMU"""
        # Each servomotor position and velocity
        obs, _ = self.servomotors.get_observations()
        self.observation[:2*18] = obs[:2*18]
