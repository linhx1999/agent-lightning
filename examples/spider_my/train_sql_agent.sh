#! /bin/bash

# 指定使用的gpu
export CUDA_VISIBLE_DEVICES=2,3

python train_sql_agent.py qwen