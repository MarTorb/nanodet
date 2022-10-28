#!/bin/bash
#SBATCH --job-name="prosjektoppgave-nanodet"
#SBATCH --account=ie-idi
#SBATCH --time=05:00:00
#SBATCH --nodes=1
#SBATCH -c 28
#SBATCH --partition=GPUQ
#SBATCH --gres=gpu:1
#SBATCH --constraint=V100

#module load Python/3.8.6-GCCcore-10.2.0
module load CUDA/11.1.1-GCC-10.2.0
module load Anaconda3/2020.07

conda update -n base -c defaults conda
conda init --all
#exec $SHELL
source activate
conda create -n nanodet python=3.10 -y --force
conda activate nanodet

conda install pytorch torchvision cudatoolkit=11.1 -c pytorch -c conda-forge

pip install -r requirements.txt

python setup.py develop

python tools/train.py config/nanodet-test.yml
