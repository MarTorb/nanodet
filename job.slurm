#!/bin/bash
#SBATCH --job-name="prosjektoppgave-nanodet"
#SBATCH --account=ie-idi
#SBATCH --time=07-00:00:00
#SBATCH --partition=GPUQ
#SBATCH --gres=gpu:A100m80:1
#SBATCH --mem=100G

source ~/.bashrc

conda activate nanodet

python tools/train.py $1
