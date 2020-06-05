import gym
import pybullet as p
from time import sleep

# Connect to BulletPhysics GUI, can be DIRECT if no user inputs
p.connect(p.GUI)
env = gym.make('gym_kraby:HexapodBulletEnv-v0')
observation = env.reset()
done = False

# Create user debug interface
params = [p.addUserDebugParameter(p.getJointInfo(env.robot_id, j)[1].decode(), -1, 1, 0)
          for j in env.joint_list]

while not done:
    # Read user input and simulate motor
    a = [p.readUserDebugParameter(param) for param in params]
    observation, reward, done, _ = env.step(a)
    #observation, reward, done, _ = env.step(env.action_space.sample())
    print("\nobservation", observation)
    print("reward", reward)
    print("done", done)
    sleep(0.01)

print("[!] Robot has fallen")
env.close()
