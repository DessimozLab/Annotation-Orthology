#!/bin/bash

#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=ornaug

augustus --codingseq=on --species=human ./chord_genos/ornithorhynchus_anatinus.genome.fa > ./chord_genos/ORANA.gff
