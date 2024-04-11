#!/bin/bash
  
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=xenaug

augustus --codingseq=on --species=human ./chord_genos/xenopus_tropicalis.genome.fa > ./chord_genos/XENTR.gff
