## Overview

To deploy AI models that require NVIDIA GPU

## Setup host

- Install NVIDIA and cuda driver
- Install the latest docker-ce (>=19.3)
- Install `nvidia-container-runtime` package
- Test: `docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi`

## Build docker image

```
cd THIS_FOLDER
docker build . -t ntoand/gpu-docker-base
```

## Check built image

```
docker images
```

## Run with an interative mode

```
docker run --rm -it -v /absolute/path/to/source:/molemap_dir -v /absolute/path/to/checkpoints:/checkpoints -e PORT=PORT -p PORT:PORT molemap_phase2_base

Example:
docker run --rm -it -v /Users/toand/git/merc/ai/molemap/docker/phase2_deploy/resnet50_transformer:/molemap_dir -v /Users/toand/git/merc/ai/molemap/docker/phase2_deploy/checkpoints:/checkpoints -e PORT=3000 -p 3000:3000 molemap_phase2_base
```

## Run as daemon

```
docker run -d -v /absolute/path/to/source:/molemap_dir -v /absolute/path/to/checkpoints:/checkpoints -e PORT=PORT -p PORT:PORT molemap_phase2_base
```


