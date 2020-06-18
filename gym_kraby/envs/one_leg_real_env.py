import numpy as np
import pybullet as p
from ..utils.herkulex_socket import HerkulexSocket
from .one_leg_bullet_env import OneLegBulletEnv


class OneLegRealEnv(OneLegBulletEnv):
    """One leg Hexapod environnement for transfer to real robot
    """

    def __init__(self, time_step=0.01, max_step=200, render=False):
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
        all_states = p.getJointStates(self.robot_id, self.joint_list)  # TODO
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
        pos, ori, _, _, _, _ = p.getLinkState(self.robot_id, endcap_id)  # TODO
        self.observation[-6:] = list(pos) + list(p.getEulerFromQuaternion(ori))
        self.observation[-3:] /= np.pi  # normalization
