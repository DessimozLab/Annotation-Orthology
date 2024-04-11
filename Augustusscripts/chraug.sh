#!/bin/bash
  
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=chraug

augustus --codingseq=on --species=chicken ./chord_genos/chrysemys_picta_bellii.genome.fa > ./chord_genos/CHPIB.gff
