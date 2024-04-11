#!/bin/bash

#SBATCH --partition=cpu
#SBATCH --time 04:00:00
#SBATCH --mem 5G
#SBATCH --job-name=ecnj

mkdir ENAUaug

/work/FAC/FBM/DBC/cdessim2/default/sprietob/Augustus/scripts/createAugustusJoblist.pl --sequences="/work/FAC/FBM/DBC/cdessim2/default/sprietob/assemblies20/ecnauparallel/ECNAUchr.list" --wrap="#" --overlap=50000 --chunksize=1252500 --outputdir="/work/FAC/FBM/DBC/cdessim2/default/sprietob/assemblies20/ecnauparallel/ECNAUaug" --joblist="ECNAUjobs.lst" --jobprefix="ECNAUaugjob_" --command "augustus --codingseq=on --species=zebrafish"

/Annotation-Orthology/Augustus/scripts/createAugustusJoblist.pl --sequences="ECNAUchr.list" --wrap="#" --overlap=50000 --chunksize=1252500 --outputdir="ECNAUaug" --joblist="ECNAUjobs.lst" --jobprefix="ECNAUaugjob_" --command "augustus --codingseq=on --species=zebrafish"

