CUDA_VISIBLE_DEVICES=0
NPROC=1
ANATOMY=brain
DATA=original
NATIVE_SNR=32dB
INFERENCE_SNR=22dB
ROOT=/csiNAS/asad/EDM-FastMRI
MODEL_PATH=network-snapshot.pkl
MEAS_PATH=/csiNAS/asad/data/brain_fastMRI/val_samples_noisy/$NATIVE_SNR
KSP_PATH=/csiNAS/asad/data/brain_fastMRI/val_samples_noisy/$INFERENCE_SNR
R=8
STEPS=500
SEED=15
SAMPLE_START=0
SAMPLE_END=100

torchrun --standalone --nproc_per_node=$NPROC dps.py \
    --seed $SEED --latent_seeds $SEED --gpu=$CUDA_VISIBLE_DEVICES \
    --sample_start $SAMPLE_START --sample_end $SAMPLE_END \
    --inference_R $R --noise_sigma $NOISE_SIGMA \
    --num_steps $STEPS --S_churn 0 \
    --measurements_path $MEAS_PATH \
    --network=$ROOT/models/$ANATOMY/$DATA/$MODEL_PATH \
    --outdir=$ROOT/results/posterior/$ANATOMY/$DATA