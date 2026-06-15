#!/bin/bash -l
#SBATCH --job-name=qwen_parallel
#SBATCH --nodes=1                   # Number of nodes
#SBATCH --ntasks-per-node=1         # One MPI rank per node
#SBATCH --gpus-per-node=1           # GPUs per node
#SBATCH --mem=32G                   # RAM per node
#SBATCH --time=04:00:00             # Wall time limit (HH:MM:SS)
#SBATCH --output=logs/%j_out.txt    # stdout log
#SBATCH --error=logs/%j_err.txt     # stderr log
#SBATCH --partition=gpu-mi50

# Load necessary modules
vpkg_require amd-rocm
source /opt/shared/miniforge/25.11.0-1/etc/profile.d/conda.sh
conda activate /home/4357/conda-envs/qwen/pkgs

# Run the script
mpirun -n 1 python vqa_val_dataset.py
