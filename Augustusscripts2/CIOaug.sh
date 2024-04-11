#!/bin/bash
  
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=cionaug  

augustus --codingseq=on --species=ciona ./chord_genos/ciona_intestinalis.genome.fa > ./chord_genos/CIONA.gff
