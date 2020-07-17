# Learning algorithm

[TOC]

## Choosing a learning algorithm

This project choose to use **Proximal Policy Optimization** which is an **on-policy**, policy gradient method.
Other popular algorithm are:

-   **Deep Q-learning** (DQN) which works well on environments with discrete action spaces but performs less well on continuous control benchmarks. "Q-learning quickly become infeasible when naive discretization of the action space is performed, due to the curse  of  dimensionality", [[Duan et al., 2016](references.md#DuanCHSA16)].
-   **"Vanilla" Policy Gradient** methods which have poor data efficiency and robustness.
-   **Trust Region / natural Policy gradient** methods (such as TRPO) which has a similar data efficiency and performance compared to PPO, while being more complicated [[Schulman et al., 2017](references.md#schulman2017ppo)].

### On-policy vs Off-policy

An **on-policy** algorithm does not use old data.
In our case it means that one batch of simulation episodes will one be used to train the next policy,
and sample won't be stored in memory to be reused later.

This implies that on-policy algorithms are less sample efficient compared to off-policy.
Nonetheless it increases learning stability.

> These algorithms directly optimize [...] policy performance and it works out mathematically that you need on-policy data to calculate the updates. So, this family of algorithms trades off sample efficiency in favor of stability—but you can see the progression of techniques (from VPG to TRPO to PPO) working to make up the deficit on sample efficiency. <br/>
> \-- [Algorithms, OpenAI SpinningUp](https://spinningup.openai.com/en/latest/user/algorithms.html#the-on-policy-algorithms)

### Policy Gradient Methods

Let's define some common notations in reinforcement learning:

-   $\theta$ contains parameters to optimize,
-   $a_t$ is the action taken and $s_t$ the observation at step $t$.
-   $\pi_θ$ is a stochastic policy,
-   $\hat A_t$ is an estimator of the advantage function at time step t.

Policy Gradient Methods estimate the gradient estimator $g$ at the step $t$ with an empirical average over a **batch of sample**,
$$
\hat g = \hat{\mathbb E}_t \left[ \nabla_θ \log \pi_θ (a_t|s_t) \hat A_t \right]
$$

Then this gradient estimate is used in a stochastic gradient ascent algorithm. The one our implementation uses is **Adaptive Moment Estimation** [[Kingma and Ba, 2014](references.md#kingma2014method)].

When training we will alternate between running simulation environments to generate a batch of sample (CPU/RAM bottlenecked)
and optimization (GPU).

## Proximal Policy Optimization

Proximal Policy Optimization is a policy gradient method for reinforcement
learning developed by OpenAI[^PPO_OpenAI].
The following video explains clearly how Proximal Policy Optimization works.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/5P7I-xPq8u8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Original paper : <https://arxiv.org/abs/1707.06347>.

## Using different implementations of PPO

The following implementations were tested:

-   [pytorch-a2c-ppo-acktr-gail](https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail) (PyTorch),
-   [StableBaselines](https://github.com/hill-a/stable-baselines) (Tensorflow 1),
-   [StableBaselines3](https://github.com/DLR-RM/stable-baselines3) (PyTorch),
-   [OpenAI SpinningUp](https://github.com/openai/spinningup) (PyTorch and Tensorflow 1).

OpenAI developed internally a new training system called OpenAI Rapid
implementing PPO at large scale. It can train a policy on large cloud
platform (such as Kubernetes) using CPU workers for rollout and eval and GPU
workers for optimization[^OpenAI_Rapid].
Other companies are developing alternatives such as
[Facebook ReAgent](https://github.com/facebookresearch/ReAgent)
or [Intel Coach](https://github.com/NervanaSystems/coach).

[Garage](https://github.com/rlworkgroup/garage) also implements PPO for
Tensorflow and PyTorch
but Garage documentation does not introduce as many concepts as StableBaselines
and is more intended for experimented users. 

[TensorForce](https://github.com/tensorforce/tensorforce) implements PPO
for Tensorflow 2 which gives access to the new profiler and tools compared to the other toolkits.
It also provides a hyperparameter tuner. Like Garage, it is also geared towards
more experimented users.

[RLlib](https://docs.ray.io/en/latest/rllib-algorithms.html#ppo) implements PPO
in a scalable way with PyTorch. This implementation looks promising but has not been tested.

### Using pytorch-a2c-ppo-acktr-gail PPO (PyTorch)

[pytorch-a2c-ppo-acktr-gail](https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail)
is a PPO implementation with PyTorch.
It is simple to use but lacks many features compared to other toolkits.

You need to install PyTorch and NVIDIA Cuda for GPU acceleration.
On ArchLinux you may just need to install `python-pytorch-opt-cuda`
witch is a compiled version of PyTorch
for post Hashell Intel CPU and NVIDIA Cuda.

Then clone the source code and start training,

```bash
git clone https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail
cd pytorch-a2c-ppo-acktr-gail
python main.py --env-name gym_kraby:OneLegBulletEnv-v0 --algo ppo --use-gae \
               --log-interval 1 --num-steps 2048 --num-processes 1 --lr 3e-4 \
               --entropy-coef 0 --value-loss-coef 0.5 --ppo-epoch 10 \
               --num-mini-batch 32 --gamma 0.99 --gae-lambda 0.95 \
               --num-env-steps 1000000 --use-linear-lr-decay --no-cuda \
               --seed 0 --use-proper-time-limits
```

Then follow instructions of the README.

!!! Note "Running simultaneous training"

    [generate_tmux_yaml.py](https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail/blob/master/generate_tmux_yaml.py)
    generates a tmuxp Yaml configuration file to launch simultaneous experiments.
    You can run the experiments with
    `tmuxp load run_all.yaml`.

### Using StableBaselines PPO (Tensorflow 1)

[StableBaselines](https://github.com/hill-a/stable-baselines) is a fork
of OpenAI Baselines that make it more easier to use for beginners
and cleans up the code base.
[StableBaselines documentation](https://stable-baselines.readthedocs.io/en/master/)
introduces many key concepts and is quite clear about PPO parameters.

As StableBaselines current stable version supports only Tensorflow 1,
you may use Docker to isolate the requirements.
More detailed instructions are available at
[Tensorflow documentation](https://www.tensorflow.org/install/docker).
Install `docker` and `nvidia-container-toolkit`,
restart `docker` daemon then start a Jupyter Notebook environment
as your user and with GPU support by running in repository folder:

```bash
docker build -f Dockerfile.stablebaselines -t kraby-stablebaselines .
docker run -it -u $(id -u):$(id -g) --gpus all --rm \
    --env="DISPLAY"  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v $(pwd):/tf/kraby -p 8888:8888 kraby-stablebaselines
```

Some notebooks are available in `kraby/notebooks/stablebaselines/`.

!!! Note

    `-u $(id -u):$(id -g) --env="DISPLAY"  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"` is required to use X11 windows in Docker container and launch PyBullet debugging GUI. It forwards the host X11 server.

### Using OpenAI Spinning Up PPO (PyTorch)

[OpenAI Spinning Up](https://spinningup.openai.com/en/latest/) is a more recent
implementation than OpenAI Baselines.
It is geared toward giving a well-documented code repository of short
implementations of key algorithms.

For an easier setup you may use Docker to isolate the requirements.
Install `docker` and `nvidia-container-toolkit`,
restart `docker` daemon then start a Jupyter Notebook environment
as your user and with GPU support by running in repository folder:

```bash
docker build -f Dockerfile.spinningup -t kraby-spinningup .
docker run -it -u $(id -u):$(id -g) --gpus all --ipc=host --rm \
    -v $(pwd):/workdir -v $(pwd)/spinningup_data:/opt/spinningup/data \
    -p 8888:8888 kraby-spinningup
```

Some notebooks are available in `kraby/notebooks/spinningup/`.

[^PPO_OpenAI]: "Proximal Policy Optimization." OpenAI Blog. <https://openai.com/blog/openai-baselines-ppo/>.

[^OpenAI_Rapid]: "Rapid, OpenAI Five." OpenAI Blog. <https://openai.com/blog/openai-five/#rapid>
