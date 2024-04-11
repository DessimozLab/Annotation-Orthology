#!/bin/bash
  
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=saraug

augustus --codingseq=on --species=human ./chord_genos/sarcophilus_harrisii.genome.fa > ./chord_genos/SARHA.gff
