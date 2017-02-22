#!/usr/bin/env sh
# Create the imagenet lmdb inputs
# N.B. set the path to the imagenet train + val data dirs

EXAMPLE=/media/goods/newdata
DATA=/home/caffe-future/examples/mytext
TOOLS=/home/caffe-future/.build_debug/tools

TRAIN_DATA_ROOT=/media/
VAL_DATA_ROOT=/media/
TRAIN_LABEL_ROOT=/media/
VAL_LABEL_ROOT=/media/
# Set RESIZE=true to resize the images to 256x256. Leave as false if images have
# already been resized using another tool.

RESIZE=false
if $RESIZE; then
  RESIZE_HEIGHT=500
  RESIZE_WIDTH=500
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

# if [ ! -d "$TRAIN_DATA_ROOT" ]; then
#  echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
#  echo "Set the TRAIN_DATA_ROOT variable in create_imagenet.sh to the path" \
#       "where the ImageNet training data is stored."
#  exit 1
#fi

#if [ ! -d "$VAL_DATA_ROOT" ]; then
#  echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
#  echo "Set the VAL_DATA_ROOT variable in create_imagenet.sh to the path" \
#       "where the ImageNet validation data is stored."
#  exit 1
#fi

echo "Creating train_data lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    $TRAIN_DATA_ROOT \
    $DATA/Tra.txt \
    $EXAMPLE/train_data_lmdb

echo "Creating train_label lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --gray \
    $TRAIN_LABEL_ROOT \
    $DATA/TraNG.txt \
    $EXAMPLE/train_label_lmdb

echo "Creating val_data lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    $VAL_DATA_ROOT \
    $DATA/Va.txt \
    $EXAMPLE/val_data_lmdb

echo "Creating val_label lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --gray \
    $VAL_LABEL_ROOT \
    $DATA/VaG.txt \
    $EXAMPLE/val_label_lmdb

echo "Done."
