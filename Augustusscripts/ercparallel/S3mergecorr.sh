#!/bin/bash

#SBATCH --partition=cpu
#SBATCH --job-name=ercmerg

for x in `cat ERCALjobs.lst`
do
cat $x | perl -ne 'if(m/--outfile=(\S*) --errfile/){print $1}'  | xargs cat
done | ./Augustus/scripts/join_aug_pred.pl > ERCALaugustus.gff
