#!/bin/bash
  
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=phoaug

augustus --codingseq=on --species=human ./chord_genos/phocoena_sinus.genome.fa > ./chord_genos/PHOSI.gff
