CUDA_VISIBLE_DEVICES=1
NPROC=1
ANATOMY=brain
NATIVE_SNR=32dB
ROOT=/csiNAS/asad/EDM-FastMRI
MODEL_PATH=network-snapshot.pkl
MEAS_PATH=/csiNAS/asad/data/brain_fastMRI/val_samples_noisy/$NATIVE_SNR
STEPS=500
SEED=15
SAMPLE_START=0
SAMPLE_END=100

for DATA in noisy32dB noisy22dB noisy12dB denoised32dB denoised22dB denoised12dB
do
    for INFERENCE_SNR in 32dB 22dB 12dB
    do                
        for R in 4 8
        do
            KSP_PATH=/csiNAS/asad/data/brain_fastMRI/val_samples_noisy/$INFERENCE_SNR
            
            python -m torch.distributed.run --standalone --nproc_per_node=$NPROC dps.py \
            --seed $SEED --latent_seeds $SEED --gpu=$CUDA_VISIBLE_DEVICES \
            --sample_start $SAMPLE_START --sample_end $SAMPLE_END \
            --inference_R $R --inference_snr $INFERENCE_SNR \
            --num_steps $STEPS --S_churn 0 \
            --measurements_path $MEAS_PATH \
            --ksp_path $KSP_PATH \
            --network=$ROOT/models/$ANATOMY/$DATA/$MODEL_PATH \
            --outdir=$ROOT/results/posterior/$ANATOMY/$DATA
        done
    done
done