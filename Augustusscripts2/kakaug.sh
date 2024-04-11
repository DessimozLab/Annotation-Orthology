#!/bin/bash
  
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=kakaug 

augustus --codingseq=on --species=chicken ./chord_genos/strigops_habroptila.genome.fa > ./chord_genos/KAKAP.gff
