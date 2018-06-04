#!/bin/bash

PATH_TO_CHECKPOINT=/media/remote_home/mgarbade/datasets/nyu_depth_v2/01_TrainNyu11_ic255/
PATH_TO_EVAL_DIR=/media/remote_home/mgarbade/datasets/nyu_depth_v2/01_TrainNyu11_ic255_eval/
PATH_TO_DATASET=/media/remote_home/mgarbade/datasets/nyu_depth_v2/tfrecord/



# From tensorflow/models/research/
python deeplab/eval.py \
    --logtostderr \
    --eval_split="val" \
    --model_variant="xception_65" \
    --atrous_rates=6 \
    --atrous_rates=12 \
    --atrous_rates=18 \
    --output_stride=16 \
    --decoder_output_stride=4 \
    --eval_crop_size=480 \
    --eval_crop_size=640 \
    --dataset="nyu" \
    --checkpoint_dir=${PATH_TO_CHECKPOINT} \
    --eval_logdir=${PATH_TO_EVAL_DIR} \
    --dataset_dir=${PATH_TO_DATASET}