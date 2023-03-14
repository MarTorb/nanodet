#!/bin/bash
#SBATCH --job-name="prosjektoppgave-nanodet"
#SBATCH --account=ie-idi
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH -c 28
#SBATCH --partition=GPUQ
#SBATCH --gres=gpu:1
##SBATCH --constraint=V100


source ~/.bashrc

conda activate nanodet

python demo/demo.py image --config config/$1_$2.yml --model workspace/$1_$2/model_best/nanodet_model_best.pth --path $1/test/ --save_result
