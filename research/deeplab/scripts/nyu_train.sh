#!/bin/bash

#block(name=trn_nyu_dplb_v3, threads=1, memory=1000, gpus=1, hours=250)


cd /media/remote_home/mgarbade/libs/models/research

PATH_TO_DATASET=/media/remote_home/mgarbade/datasets/nyu_depth_v2/tfrecord/
PATH_TO_TRAIN_DIR=/media/remote_home/mgarbade/datasets/nyu_depth_v2/01_TrainNyu11_ic255/
PATH_TO_INITIAL_CHECKPOINT=/media/remote_home/mgarbade/libs/models/research/deeplab/models/deeplabv3_pascal_trainval/model.ckpt
python deeplab/train.py \
    --logtostderr \
    --training_number_of_steps=30000 \
    --train_split="train" \
    --model_variant="xception_65" \
    --atrous_rates=6 \
    --atrous_rates=12 \
    --atrous_rates=18 \
    --output_stride=16 \
    --decoder_output_stride=4 \
    --train_crop_size=513 \
    --train_crop_size=513 \
    --train_batch_size=1 \
    --dataset="nyu" \
    --tf_initial_checkpoint=${PATH_TO_INITIAL_CHECKPOINT} \
    --train_logdir=${PATH_TO_TRAIN_DIR} \
    --dataset_dir=${PATH_TO_DATASET} \
    --initialize_last_layer=false \
    --fine_tune_batch_norm=false 
    
#     --last_layer_gradient_multiplier=10
#/media/remote_home/mgarbade/datasets/nyu_depth_v2
