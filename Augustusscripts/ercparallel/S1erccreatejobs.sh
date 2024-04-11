#!/bin/bash

#SBATCH --partition=cpu
#SBATCH --time 04:00:00
#SBATCH --mem 5G
#SBATCH --job-name=ercj

/work/FAC/FBM/DBC/cdessim2/default/sprietob/Augustus/scripts/createAugustusJoblist.pl --sequences="/work/FAC/FBM/DBC/cdessim2/default/sprietob/assemblies20/ercparallel/ERCALchr.list" --wrap="#" --overlap=50000 --chunksize=1252500 --outputdir="/work/FAC/FBM/DBC/cdessim2/default/sprietob/assemblies20/ercparallel/ERCALaug" --joblist="ERCALjobs.lst" --jobprefix="ERCALaugjob_" --command "augustus --codingseq=on --species=zebrafish"



