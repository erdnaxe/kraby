# Build a docker image containing:
# * Tensorflow 1.15 with Cuda support
# * Stable-Baselines

FROM tensorflow/tensorflow:1.15.2-gpu-py3-jupyter
RUN apt-get update && \
    apt-get install -y libsm6 libxext6 libxrender-dev cmake zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*
RUN pip install gym stable-baselines
WORKDIR /tf/kraby
COPY . /tf/kraby
RUN pip install -e .
