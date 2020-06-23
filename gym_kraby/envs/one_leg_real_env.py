import numpy as np
from ..utils.herkulex_socket import HerkulexSocket
from .one_leg_bullet_env import OneLegBulletEnv


class OneLegRealEnv(OneLegBulletEnv):
    """One leg Hexapod environnement for transfer to real robot
    """

    def __init__(self, time_step=0.01, max_step=200, render=False):
        """Init environment
        """
        super().__init__(time_step, max_step, render)
        self.servomotors = HerkulexSocket(
            max_velocity=6.308,  # rad/s
            max_torque=1.57,  # N.m
        )

    def reset(self):
        """Override reset to reset servomotors
        """
        self.servomotors.reset()
        return super().reset()

    def step(self, action):
        """Override step to move servomotors
        """
        # TODO send transformed_action velocities and set max_torques
        return super().step(action)

    def _update_observation(self):
        """Override to get observation from real sensors
        """
        # Each servomotor position, speed and torque
        self.observation[0:3*3] = self.servomotors.get_observations()

        # Sometimes 1.0 is greater than 1
        self.observation = np.clip(self.observation, -1., 1.)
