import numpy as np
import pybullet as p
from ..utils.herkulex_socket import HerkulexSocket
from .hexapod_bullet_env import HexapodBulletEnv


class HexapodRealEnv(HexapodBulletEnv):
    """Hexapod environnement for transfer to real robot
    """

    def __init__(self, time_step=0.01, max_step=1000, render=False):
        """Init environment
        """
        super().__init__(time_step, max_step, render)
        self.servomotors = HerkulexSocket()

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
        all_states = self.servomotors.get_observations()
        for i, (pos, vel, _, tor) in enumerate(all_states):
            self.observation[3*i:3*i+3] = [
                2 * pos / np.pi,
                vel / self.servo_max_speed,
                tor / self.servo_max_torque
            ]

        # Sometimes 1.0 is greater than 1
        self.observation = np.clip(self.observation, -1., 1.)

        # Robot position and orientation
        pos, ori = p.getBasePositionAndOrientation(self.robot_id)  # TODO Use IMU
        self.observation[-6:] = list(pos) + list(p.getEulerFromQuaternion(ori))
        self.observation[-3:] /= np.pi  # normalization
