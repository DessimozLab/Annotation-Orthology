#!/bin/bash
  
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=taeaug

augustus --codingseq=on --species=chicken ./chord_genos/taeniopygia_guttata.genome.fa > ./chord_genos/TAEGU.gff
