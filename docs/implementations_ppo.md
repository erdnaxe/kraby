# PPO (Proximal Policy Optimization)

## What is PPO?

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

### Using pytorch-a2c-ppo-acktr-gail PPO (PyTorch)

This section details how to use
[pytorch-a2c-ppo-acktr-gail](https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail)
PPO implementation with PyTorch.

You need to install PyTorch and NVIDIA Cuda for GPU acceleration.
On ArchLinux you may just need to install `python-pytorch-opt-cuda`
witch is a compiled version of PyTorch
for post Hashell Intel CPU and NVIDIA Cuda.

Then clone the source code,

```bash
git clone https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail
```

Then follow instructions of the README.

### Using StableBaselines PPO (Tensorflow 1)

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
    -v $(pwd):/tf/kraby -p 8888:8888 kraby-stablebaselines
```

Some notebooks are available in `kraby/notebooks/stablebaselines/`.

### Using OpenAI Spinning Up PPO (PyTorch)

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
