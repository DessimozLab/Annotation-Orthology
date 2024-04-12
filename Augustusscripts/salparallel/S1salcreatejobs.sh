#!/bin/bash

#SBATCH --partition=cpu
#SBATCH --time 04:00:00
#SBATCH --mem 5G
#SBATCH --job-name=saljobscr

./Augustus/scripts/createAugustusJoblist.pl --sequences="./salparallel/SALTRchr.list" --wrap="#" --overlap=50000 --chunksize=1252500 --outputdir="./salparallel/SALTRaug" --joblist="SALTRjobs.lst" --jobprefix="SALTRaugjob_" --command "augustus --codingseq=on --species=zebrafish"



