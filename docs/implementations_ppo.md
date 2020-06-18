# Using different implementations of PPO

## Using pytorch-a2c-ppo-acktr-gail PPO (PyTorch)

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

## Using StableBaselines PPO (Tensorflow 1)

As StableBaselines current stable version supports only Tensorflow 1,
you may use Docker to isolate the requirements.
More detailed instructions are available at
[Tensorflow documentation](https://www.tensorflow.org/install/docker).
Install `docker` and `nvidia-container-toolkit`,
restart `docker` daemon then run:

```bash
docker pull stablebaselines/stable-baselines
git clone https://github.com/hill-a/stable-baselines -b v2.10.0
cd stable-baselines
docker run -it --gpus all --rm -v $(pwd):/root/code/stable-baselines \
    stablebaselines/stable-baselines:v2.10.0 \
    bash -c "cd /root/code/stable-baselines/ && pytest tests/"  # test
```

Then you may start a Jupyter Notebook environment
as your user and with GPU support with:

```bash
docker build -f Dockerfile.stablebaselines -t kraby-stablebaselines .
docker run -it -u $(id -u):$(id -g) --gpus all --rm \
    -v $(pwd):/tf/kraby -p 8888:8888 kraby-stablebaselines
```

Some notebooks are available in `kraby/notebooks/stablebaselines/`.

## Using OpenAI Spinning Up PPO (PyTorch)

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
