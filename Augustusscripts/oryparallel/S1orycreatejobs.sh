#!/bin/bash

#SBATCH --partition=cpu
#SBATCH --time 04:00:00
#SBATCH --mem 5G
#SBATCH --job-name=oryj

./Augustus/scripts/createAugustusJoblist.pl --sequences="./oryparallel/ORYLAchr.list" --wrap="#" --overlap=50000 --chunksize=1252500 --outputdir="./oryparallel/ORYLAaug" --joblist="ORYLAjobs.lst" --jobprefix="ORYLAaugjob_" --command "augustus --codingseq=on --species=zebrafish"



