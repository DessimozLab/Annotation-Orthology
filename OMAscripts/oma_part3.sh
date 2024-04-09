#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --time=70:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=50GB
#SBATCH --job-name=oma3N
#SBATCH --output=logs/oma3-%J.log
#SBATCH --export=None
#SBATCH --error=logs/oma3-%J.err
cd /Annotation-Orthology/OMA/OMAtopNCBI20
./bin/oma

