CUDA_VISIBLE_DEVICES=2,3
NPROC=2
LOADER=Numpy
ANATOMY=brain
DATA=original
ROOT=/csiNAS/asad/EDM-FastMRI
BATCH_SIZE=30
NORMALIZE=0

torchrun --standalone --nproc_per_node=$NPROC train.py \
 --outdir=$ROOT/models/$ANATOMY/$DATA \
 --data=$ROOT/data/$ANATOMY/$DATA \
 --cond=0 --arch=ddpmpp --duration=10 \
 --batch=$BATCH_SIZE --cbase=128 --cres=1,1,2,2,2,2,2 \
 --lr=1e-4 --ema=0.1 --dropout=0.0 \
 --desc=container_test --tick=1 --snap=200 \
 --dump=200 --seed=2023 --precond edm \
 --normalize=$NORMALIZE --loader=$LOADER --gpu=$CUDA_VISIBLE_DEVICES