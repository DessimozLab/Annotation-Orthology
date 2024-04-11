#!/bin/bash

#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=augustusmouse

augustus --codingseq=on --species=human ./chord_genos/mus_musculus.genome.fa > ./chord_genos/MOUSE.gff
