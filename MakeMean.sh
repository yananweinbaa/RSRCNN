#!/usr/bin/env sh
# Compute the mean image from the mytext training lmdb
# N.B. this is available in ytext/train

EXAMPLE=/home/caffe-future/examples/mytext
DATA=/home/caffe-future/examples/mytext
TOOLS=/home/caffe-future/.build_release/tools

$TOOLS/compute_image_mean $EXAMPLE/train_data_lmdb \
  $DATA/image_mean.binaryproto

echo "Done."
