# OpenAI Gym environments

The [gym_kraby](https://pypi.org/project/gym-kraby/) Python package includes
four OpenAI Gym environments:

-   `gym_kraby:HexapodBulletEnv-v0`: simulate full robot with BulletPhysics,

-   `gym_kraby:HexapodRealEnv-v0`: command the full real robot,

-   `gym_kraby:OneLegBulletEnv-v0`: simulate only one leg of the robot with
    BulletPhysics,

-   `gym_kraby:OneLegRealEnv-v0`: command only one leg of the robot.

You may install and test those environments by running in a Python environment:

```bash
pip install gym-kraby
python -m gym_kraby.demo --help
```

The package includes
[a demo script](https://github.com/erdnaxe/kraby/blob/master/gym_kraby/demo.py)
to test each environment.

## Using Kraby Gym environments

You may use these environments as any other OpenAI Gym
PyBullet environment:

```Python
import pybullet as p
import gym
from time import sleep

p.connect(p.GUI)
env = gym.make('gym_kraby:HexapodBulletEnv-v0')
observation = env.reset()

for _ in range(10000):
    a = env.action_space.sample()
    observation, reward, done, _ = env.step(a)
    sleep(env.dt)  # Realtime

env.close()
```
