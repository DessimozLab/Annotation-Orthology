#!/bin/bash
  
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=felaug

augustus --codingseq=on --species=human ./chord_genos/felis_catus.genome.fa > ./chord_genos/FELCA.gff
