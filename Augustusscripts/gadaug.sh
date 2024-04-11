#!/bin/bash
  
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=gadaug

augustus --codingseq=on --species=zebrafish ./chord_genos/gadus_morhua.genome.fa > ./chord_genos/GADMO.gff
