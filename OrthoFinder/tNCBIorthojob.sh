#!/bin/bash
#SBATCH --job-name=tNCBIOrthoFinder
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=48
#SBATCH --mem=50GB
#SBATCH --time=71:00:00
#SBATCH --output=OrthoFinder.%j.out
#SBATCH --error=OrthoFinder.%j.err

cd /Annotation-Orthology/orthofinder_runs/OrthoFinder
./orthofinder -t 48 -f OFtopNCBI/primary_transcripts
