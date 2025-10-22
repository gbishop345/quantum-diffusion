#!/bin/bash
#SBATCH --job-name=qddm_run
#SBATCH --partition=machinelearning
#SBATCH --gres=gpu:nvidia_h100_nvl:1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=04:00:00
#SBATCH --output=qddm_logs/slurm-%j.out   # <— logs go here

set -euo pipefail

# Ensure the log folder exists
mkdir -p qddm_logs

module load anaconda
source $(conda info --base)/etc/profile.d/conda.sh
conda activate qddm

cd "$HOME/quantum-diffusion-main/src"
python main.py