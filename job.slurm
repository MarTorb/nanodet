#!/bin/bash
#SBATCH --job-name="prosjektoppgave-nanodet"
#SBATCH --account=ie-idi
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH -c 28
#SBATCH --partition=GPUQ
#SBATCH --gres=gpu:1
#SBATCH --mem=30000
#SBATCH --constraint=A100


source ~/.bashrc

conda activate nanodet

python tools/train.py $1
