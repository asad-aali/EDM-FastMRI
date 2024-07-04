CUDA_VISIBLE_DEVICES=0,1
NPROC=2
ROOT=/csiNAS/asad/EDM-FastMRI
MODEL_PATH=network-snapshot.pkl
SAMPLE_DIM=384,320
NUM_SAMPLES=100
BATCH_SIZE=40

for ANATOMY in brain
do
        for DATA in noisy32dB noisy22dB noisy12dB denoised32dB denoised22dB denoised12dB
        do
                torchrun --standalone --nproc_per_node=$NPROC generate.py \
                        --outdir=$ROOT/results/priors/$ANATOMY/$DATA --seeds=1-$NUM_SAMPLES \
                        --batch=$BATCH_SIZE --network=$ROOT/models/$ANATOMY/$DATA/$MODEL_PATH \
                        --sample_dim=$SAMPLE_DIM --gpu=$CUDA_VISIBLE_DEVICES
        done
done