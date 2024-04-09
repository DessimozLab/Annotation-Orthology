#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --account=cdessim2_default
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=6:00:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=2GB
#SBATCH --job-name=oma1N
#SBATCH --output=logs/oma1-%J.log
#SBATCH --export=None
#SBATCH --error=logs/oma1-%J.err
cd /Annotation-Orthology/OMA/OMAtopNCBI20
./bin/oma -c
