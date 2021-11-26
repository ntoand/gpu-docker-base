#!/bin/sh

set -e

#mkdir -p /root/.cache/torch/hub/checkpoints/
#cp /checkpoints/resnet50-19c8e357.pth /root/.cache/torch/hub/checkpoints/

mkdir -p /working_dir

# Hand off to the CMD
exec "$@"
