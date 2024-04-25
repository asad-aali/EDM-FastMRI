CUDA_VISIBLE_DEVICES=0
NPROC=1
ANATOMY=brain
DATA=original
ROOT=/csiNAS/asad/EDM-FastMRI
MODEL_PATH=network-snapshot.pkl
MEAS_PATH=/csiNAS/asad/data/brain_fastMRI/val_samples_ambient
R=8
STEPS=500
SEED=15
SAMPLES=100
NOISE_SIGMA=0.078 # [0.078, 0.25]

torchrun --standalone --nproc_per_node=$NPROC dps.py \
    --seed $SEED --latent_seeds $SEED --gpu=$CUDA_VISIBLE_DEVICES \
    --samples $SAMPLES --inference_R $R \
    --num_steps $STEPS --S_churn 0 --noise_sigma $NOISE_SIGMA \
    --measurements_path $MEAS_PATH \
    --network=$ROOT/models/$ANATOMY/$DATA/$MODEL_PATH \
    --outdir=$ROOT/results/posterior/$ANATOMY/$DATA