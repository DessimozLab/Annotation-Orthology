#!/bin/bash

#SBATCH --partition=cpu
#SBATCH --job-name=orymerg

for x in `cat ORYLAjobs.lst`
do
cat $x | perl -ne 'if(m/--outfile=(\S*) --errfile/){print $1}'  | xargs cat
done | /work/FAC/FBM/DBC/cdessim2/default/sprietob/Augustus/scripts/join_aug_pred.pl > ORYLAaugustus.gff
