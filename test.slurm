#!/bin/bash
#SBATCH --job-name="prosjektoppgave-nanodet"
#SBATCH --account=ie-idi
#SBATCH --time=24:00:00
#SBATCH --partition=GPUQ
#SBATCH --gres=gpu:V100:1
#SBATCH --mem=120G

source ~/.bashrc

conda activate nanodet

echo $1

python tools/test.py --task val --config config/test/$1.yml --model workspace/$1/model_best/model_best.ckpt