#!/bin/bash

#SBATCH --partition=cpu
#SBATCH --mem 200G
#SBATCH -t 48:00:00
#SBATCH --job-name=danaug  

augustus --codingseq=on --species=zebrafish ./chord_genos/danio_rerio.genome.fa > ./chord_genos/DANRE.gff
