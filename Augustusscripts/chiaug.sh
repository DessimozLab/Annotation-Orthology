#!/bin/bash
  
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=chiaug

module load gcc augustus
augustus --codingseq=on --species=chicken ./chord_genos/gallus_gallus.genome.fa > ./chord_genos/CHICK.gff
