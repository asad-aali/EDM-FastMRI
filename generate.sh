CUDA_VISIBLE_DEVICES=2,3
NPROC=2
ANATOMY=knee
DATA=original
ROOT=/csiNAS/asad/EDM-FastMRI
MODEL_PATH=00000-original-uncond-ddpmpp-edm-gpus2-batch14-fp32-container_test/network-snapshot-001612.pkl
SAMPLE_DIM=384,320
NUM_SAMPLES=100
BATCH_SIZE=20

torchrun --standalone --nproc_per_node=$NPROC generate.py \
        --outdir=$ROOT/results/priors/$ANATOMY/$DATA --seeds=1-$NUM_SAMPLES \
        --batch=$BATCH_SIZE --network=$ROOT/models/$ANATOMY/$DATA/$MODEL_PATH \
        --sample_dim=$SAMPLE_DIM --gpu=$CUDA_VISIBLE_DEVICES