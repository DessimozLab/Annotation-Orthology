#!/bin/bash

#SBATCH --partition=cpu
#SBATCH --time 04:00:00
#SBATCH --mem 5G
#SBATCH --job-name=ercj

./Augustus/scripts/createAugustusJoblist.pl --sequences="./ercparallel/ERCALchr.list" --wrap="#" --overlap=50000 --chunksize=1252500 --outputdir="./ercparallel/ERCALaug" --joblist="ERCALjobs.lst" --jobprefix="ERCALaugjob_" --command "augustus --codingseq=on --species=zebrafish"



