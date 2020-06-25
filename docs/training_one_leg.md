# Training one hexapod leg

This section gives some example of training and draws some conclusions about
the training of a single robot leg.

**Note**: Some early tests were done on StableBaselines3
but as the library is currently being developed,
the training was failing and the average episode reward was constant.

## First tests with pytorch-a2c-ppo-acktr-gail

The defaults hyperparameters given in the
[README](https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail/blob/master/README.md)
are recommanded and are able to give good results for a first training.

**Important**: The reward function is only using the distance to a **fixed** objective,
and the observation contains the position, velocity and torque of each servomotors
and also **the absolute position of the endcap** of the leg.
*This agent is trained on an unrealistic environment.*

![Training results](img/training_one_leg_pytorch-a2c-ppo-acktr-gail.png)

## Testing StableBaselines

Start StableBaselines Docker as explained in [previous page](implementations_ppo.md).
Then in Jupyter web interface,

-   `check_env.ipynb` will check that OpenAI Gym environments are working as expected,
-   `one_leg_training.ipynb` is an example of PPO training on one leg,
-   `render.ipynb` will render the agent to a MP4 video or a GIF.

As planned, it works as well as `pytorch-a2c-ppo-acktr-gail` on PyTorch,
but this time we get much more tools such as
[TensorBoard](https://www.tensorflow.org/tensorboard) data and graph.

As StableBaselines stands out as being an easy PPO implementation
with a clear documentation and hyperparameters,
all the following training were done with it.
