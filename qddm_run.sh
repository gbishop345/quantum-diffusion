#!/bin/bash
#SBATCH --job-name=qddm_run
#SBATCH --partition=machinelearning
#SBATCH --nodelist=mlgong               
#SBATCH --gres=gpu:nvidia_h100_nvl:1    
#SBATCH --cpus-per-task=48             
#SBATCH --mem=64G                      
#SBATCH --time=08:00:00
#SBATCH --output=/home/gbishop2/quantum-diffusion-main/qddm_logs/slurm-%j.out
#SBATCH --chdir=/home/gbishop2/quantum-diffusion-main/src

set -euo pipefail
mkdir -p /home/gbishop2/quantum-diffusion-main/qddm_logs

# --- Load and activate Conda environment ---
module load anaconda
eval "$(conda shell.bash hook)"
conda activate qddm

# --- Confirm environment ---
echo "Node: $(hostname)"
echo "Python: $(which python)"
python -V
nvidia-smi || echo "No GPU detected."

# --- Run program ---
python main.py

# --- Done ---
echo "Job complete at $(date)"
