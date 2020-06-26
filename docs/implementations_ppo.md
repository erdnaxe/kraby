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

[Garage](https://github.com/rlworkgroup/garage) also implements PPO for
Tensorflow and PyTorch
but Garage documentation does not introduce as many concepts as StableBaselines
and is more intended for experimented users. 

[TensorForce](https://github.com/tensorforce/tensorforce) implements PPO
for Tensorflow 2 which gives access to the new profiler and tools compared to the other toolkits.
It also provides a hyperparameter tuner. Like Garage, it is also geared towards
more experimented users.

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

#### Running simultaneous training

[generate_tmux_yaml.py](https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail/blob/master/generate_tmux_yaml.py)
generates a tmuxp Yaml configuration file to launch simultaneous experiments.
This is a modified version for `gym_kraby:OneLegBulletEnv-v0`:

```Python
import yaml

ppo_mujoco_template = "python main.py --env-name {0} --algo ppo --use-gae --log-interval 1 --num-steps 2048 --num-processes 1 --lr 3e-4 --entropy-coef 0 --value-loss-coef 0.5 --ppo-epoch 10 --num-mini-batch 32 --gamma 0.99 --gae-lambda 0.95 --num-env-steps 1000000 --use-linear-lr-decay --no-cuda --log-dir /tmp/gym/{1}/{1}-{2} --seed {2} --use-proper-time-limits"
template = ppo_mujoco_template
env_name = "gym_kraby:OneLegBulletEnv-v0"
config = {"session_name": "run-all", "windows": []}

for i in range(16):
    panes_list = []
    panes_list.append(
        template.format(env_name,
                        env_name.split('-')[0].lower(), i))

    config["windows"].append({
        "window_name": "seed-{}".format(i),
        "panes": panes_list
    })

yaml.dump(config, open("run_all.yaml", "w"), default_flow_style=False)
```

After launching this script you can run the experiments,

```bash
tmuxp load run_all.yaml
```

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
    -v $(pwd):/tf/kraby -p 8888:8888 kraby-stablebaselines
```

Some notebooks are available in `kraby/notebooks/stablebaselines/`.

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
