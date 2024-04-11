#!/bin/bash
  
#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=lepaug

augustus --codingseq=on --species=zebrafish ./chord_genos/lepisosteus_oculatus.genome.fa > ./chord_genos/LEPOC.gff
