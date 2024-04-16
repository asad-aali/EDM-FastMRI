CUDA_VISIBLE_DEVICES=2,3
ROOT=/csiNAS2/slow/brett/edm_outputs
MODEL_PATH=00037-fastmri_brain_preprocessed_9_25_23-uncond-ddpmpp-edm-gpus4-batch40-fp32-aspect
MODEL_NAME=network-snapshot-004800.pkl

torchrun --standalone --nproc_per_node=2 generate.py \
        --outdir=results/priors/$MODEL_PATH --seeds=0-15 --batch=8 \
        --network=$ROOT/$MODEL_PATH/$MODEL_NAME --gpu=$CUDA_VISIBLE_DEVICES