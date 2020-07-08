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
    metadata = {
        "render.modes": ["human", "rgb_array"],
        "video.frames_per_second": 100,
    }

    def __init__(self, time_step=0.01, delta=0.5, render=False):
        """Init environment
        """
        super().__init__()

        # Init PyBullet in GUI or DIRECT mode
        self._render = render
        if self._render:
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

        # 3*(position,speed) + position target
        self.n_observation = 3*2+3
        self.observation_space = spaces.Box(low=-1, high=1,
                                            shape=(self.n_observation,),
                                            dtype="float32")
        self.observation = np.zeros(self.n_observation, dtype="float32")
        self.torques = np.zeros(self.n_actions)

        # Environment timestep and constants
        self.dt = time_step
        self.servo_max_speed = 6.308  # rad/s
        self.servo_max_torque = 1.57  # N.m

        # Size of the box in which we pick the target
        self.delta = delta  # from 0 to 1

        # Seed random number generator
        self.seed()

        # Init world
        p.setTimeStep(time_step)
        p.resetSimulation()
        p.setGravity(0, 0, -9.81)  # Newton's apple
        p.setAdditionalSearchPath(getDataPath())  # Add pybullet_data
        p.loadURDF("plane.urdf")  # Load a ground

        # Load robot
        flags = p.URDF_USE_SELF_COLLISION | p.URDF_USE_INERTIA_FROM_FILE
        # flags |= p.URDF_MERGE_FIXED_LINKS  # pybullet>2.89
        # flags |= p.URDF_IGNORE_VISUAL_SHAPES  # pybullet>2.89, see collisions
        with pkg_resources.path("gym_kraby", "data") as path:
            self.robot_id = p.loadURDF(str(path / 'one_leg.urdf'), flags=flags,
                                       useFixedBase=True)

        # Get all motorized joints id and name (which are revolute joints)
        self.joint_list = [j for j in range(p.getNumJoints(self.robot_id))
                           if p.getJointInfo(self.robot_id, j)[2] == p.JOINT_REVOLUTE]

    def reset(self):
        # Reset all joint using normal distribution
        for j in self.joint_list:
            p.resetJointState(self.robot_id, j,
                              np.random.uniform(low=-np.pi/4, high=np.pi/4))

        # Set random target and put it in observations
        self.target_position = np.array([
            np.random.uniform(0.219 - 0.069*self.delta,
                              0.219 + 0.069*self.delta),
            np.random.uniform(0.020 - 0.153*self.delta,
                              0.020 + 0.153*self.delta),
            np.random.uniform(0.128 - 0.072*self.delta,
                              0.128 + 0.072*self.delta),
        ])
        self.observation[-3:] = self.target_position

        # Show target as a crosshair
        p.removeAllUserDebugItems()
        p.addUserDebugLine(self.target_position - [0, 0, 0.01],
                           self.target_position + [0, 0, 0.01],
                           [0, 0, 0], 2)
        p.addUserDebugLine(self.target_position - [0, 0.01, 0],
                           self.target_position + [0, 0.01, 0],
                           [0, 0, 0], 2)

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

        # Wait for environment step
        p.stepSimulation()  # step self.dt
        if self._render:
            sleep(self.dt)  # realtime

        # Return observation, reward and done
        self._update_observation()
        reward = self._get_reward()
        done = False
        return self.observation, reward, done, {}

    def render(self, mode='human'):
        """Render environment

        PyBullet GUI can be disabled in favour of manual RGB rendering

        Args:
            mode (str, optional): Render mode. Defaults to 'human'.

        Returns:
            np.ndarray: data array
        """

        # If not asking for a RGB array, return nothing
        if mode != "rgb_array":
            return np.array([])

        view_matrix = p.computeViewMatrixFromYawPitchRoll(
            cameraTargetPosition=[0, 0, 0.05],
            distance=0.6,
            yaw=30,
            pitch=-30,
            roll=0,
            upAxisIndex=2,
        )
        proj_matrix = p.computeProjectionMatrixFOV(
            fov=60,
            aspect=960./720,
            nearVal=0.1,
            farVal=100.0,
        )
        (_, _, px, _, _) = p.getCameraImage(
            width=960,
            height=720,
            viewMatrix=view_matrix,
            projectionMatrix=proj_matrix,
            renderer=p.ER_TINY_RENDERER,
        )
        rgb_array = np.array(px)
        rgb_array = rgb_array[:, :, :3]
        return rgb_array

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
        # Distance progress toward target
        endcap_id = 5
        position, _, _, _, _, _ = p.getLinkState(self.robot_id, endcap_id)
        target_distance = np.square(position - self.target_position).sum()

        # Comsuption is speed * torque
        speeds = self.observation[1:-6:2]
        torques = self.torques
        comsuption = self.dt * abs(sum(speeds * torques))
        w = 0  # comsuption weight, FIXME: disabled

        # Compute reward
        reward = -target_distance - w * comsuption
        return reward

    def _update_observation(self):
        """
        Update the observation from BulletPhysics

        Observation contains:
        * 3x servomotor {position, speed}
        * target (x, y, z)
        """
        # Each servomotor position, speed and torque
        all_states = p.getJointStates(self.robot_id, self.joint_list)
        for i, (pos, vel, _, tor) in enumerate(all_states):
            self.torques[i] = tor / self.servo_max_torque
            self.observation[2*i:2*i+2] = [
                pos * 2 / np.pi,
                np.clip(vel / self.servo_max_speed, -1., 1.),
            ]
