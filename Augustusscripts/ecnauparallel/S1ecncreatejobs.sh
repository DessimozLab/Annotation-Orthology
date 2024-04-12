#!/bin/bash

#SBATCH --partition=cpu
#SBATCH --time 04:00:00
#SBATCH --mem 5G
#SBATCH --job-name=ecnj

mkdir ENAUaug

./Augustus/scripts/createAugustusJoblist.pl --sequences="ECNAUchr.list" --wrap="#" --overlap=50000 --chunksize=1252500 --outputdir="ECNAUaug" --joblist="ECNAUjobs.lst" --jobprefix="ECNAUaugjob_" --command "augustus --codingseq=on --species=zebrafish"

