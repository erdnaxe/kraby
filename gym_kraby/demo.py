import gym
from time import sleep
import numpy as np
import argparse


def play(env_name: str, manual_control: bool):
    # Make environment
    env = gym.make(env_name)
    observation = env.reset()

    if manual_control:
        # Create user debug interface
        params = [p.addUserDebugParameter(p.getJointInfo(env.robot_id, j)[1].decode(), -1, 1, 0)
                  for j in env.joint_list]

    reward_sum = 0
    while True:
        if manual_control:
            # Read user input and simulate motor
            a = [p.readUserDebugParameter(param) for param in params]
        else:
            a = env.action_space.sample()

        observation, reward, done, _ = env.step(a)
        reward_sum += reward
        print("\nobservation", observation)
        print("reward", reward)
        print("total reward", reward_sum)
        print("done", done)

        # Reset when done
        if done:
            observation = env.reset()
            reward_sum = 0

        # Realtime
        sleep(env.dt)

    env.close()


if __name__ == "__main__":
    # Some commandline settings
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--one-leg',
        action='store_true',
        help='simulate or command only one leg',
    )
    parser.add_argument(
        '--real',
        action='store_true',
        help='command the real robot rather than simulating',
    )
    parser.add_argument(
        '--random',
        action='store_true',
        help='randomly pick an action each step',
    )
    args = parser.parse_args()

    # Print float in decimal format
    np.set_printoptions(formatter={'float': "{0:6.3f}".format})

    # Select corresponding environment
    model = 'OneLeg' if args.one_leg else 'Hexapod'
    variant = 'Real' if args.real else 'Bullet'
    env_name = 'gym_kraby:' + model + variant + 'Env-v0'

    # Connect to BulletPhysics GUI if required
    # can be DIRECT if no user inputs
    if not args.real:
        import pybullet as p
        p.connect(p.GUI)

    # Play environment
    play(env_name, not args.random)
