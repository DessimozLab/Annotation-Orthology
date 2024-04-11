#!/bin/bash
  
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=augustushuman  

augustus --codingseq=on --species=human ./chord_genos/homo_sapiens.genome.fa > ./chord_genos/HUMAN.gff
