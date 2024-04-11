#!/bin/bash

#SBATCH --partition=cpu
#SBATCH --time 04:00:00
#SBATCH --mem 5G
#SBATCH --job-name=saljobscr

/work/FAC/FBM/DBC/cdessim2/default/sprietob/Augustus/scripts/createAugustusJoblist.pl --sequences="/work/FAC/FBM/DBC/cdessim2/default/sprietob/assemblies20/salparallel/SALTRchr.list" --wrap="#" --overlap=50000 --chunksize=1252500 --outputdir="/work/FAC/FBM/DBC/cdessim2/default/sprietob/assemblies20/salparallel/SALTRaug" --joblist="SALTRjobs.lst" --jobprefix="SALTRaugjob_" --command "augustus --codingseq=on --species=zebrafish"



