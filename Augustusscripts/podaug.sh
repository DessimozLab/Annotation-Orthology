#!/bin/bash
  
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=podaug

augustus --codingseq=on --species=chicken ./chord_genos/podarcis_muralis.genome.fa > ./chord_genos/PODMU.gff

