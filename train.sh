CUDA_VISIBLE_DEVICES=2,3
ROOT=/home/asad/EDM-FastMRI
DATA_PATH=data/original
MODEL_PATH=models/original
BATCH_SIZE=16

torchrun --standalone --nproc_per_node=2 train.py \
 --outdir=$ROOT/$MODEL_PATH \
 --data=$ROOT/$DATA_PATH \
 --cond=0 --arch=ddpmpp --duration=10 \
 --batch=$BATCH_SIZE --cbase=128 --cres=1,1,2,2,2,2,2 \
 --lr=1e-4 --ema=0.1 --dropout=0.0 \
 --desc=container_test --tick=1 --snap=200 \
 --dump=200 --seed=2023 --precond edm --gpu=$CUDA_VISIBLE_DEVICES