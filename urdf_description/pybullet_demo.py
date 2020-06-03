#!/usr/bin/env python3
import pybullet as p
import time
import pybullet_data
import os

# Connect to Bullet GUI, can be DIRECT if no user inputs
p.connect(p.GUI)

# Newton's apple
p.setGravity(0, 0, -9.81)

# Load a ground
p.setAdditionalSearchPath(pybullet_data.getDataPath())
p.loadURDF("plane.urdf")

# Load robot, as SDFormat can contain multiple object, we select the first one
# r will contain the robot object id
p.setAdditionalSearchPath(os.getcwd())
r = p.loadURDF("hexapod.urdf")

# Get all motorized joints id and name (which are revolute joints)
motorized_joints = [(j, p.getJointInfo(r, j)[1].decode())
                    for j in range(p.getNumJoints(r))
                    if p.getJointInfo(r, j)[2] == p.JOINT_REVOLUTE]

# Create user debug interface
motorized_joints_param = [(j, p.addUserDebugParameter(name, -0.5, 0.5, 0))
                          for j, name in motorized_joints]

# Simulation
while True:
    # Read user input and simulate motor
    for j, param in motorized_joints_param:
        v = p.readUserDebugParameter(param)
        p.setJointMotorControl2(r, j, p.VELOCITY_CONTROL, targetVelocity=v)

    p.stepSimulation()

p.disconnect()
