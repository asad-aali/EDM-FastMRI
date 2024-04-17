CUDA_VISIBLE_DEVICES=2,3
NPROC=2
ANATOMY=brain
DATA=original
ROOT=/csiNAS/asad/EDM-FastMRI
MODEL_PATH=00000-original-uncond-ddpmpp-edm-gpus2-batch30-fp32-container_test/network-snapshot-001000.pkl
BATCH_SIZE=8

torchrun --standalone --nproc_per_node=$NPROC generate.py \
        --outdir=$ROOT/results/priors/$ANATOMY/$DATA --seeds=0-15 \
        --batch=$BATCH_SIZE --network=$ROOT/models/$ANATOMY/$DATA/$MODEL_PATH \
        --gpu=$CUDA_VISIBLE_DEVICES