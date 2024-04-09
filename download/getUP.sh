#!/bin/bash

#SBATCH --job-name=getUP 
#SBATCH --partition=cpu
#SBATCH --nodes=1 
#SBATCH --ntasks=1 
#SBATCH --chdir=/users/sprietob/mywork/ 
#SBATCH --mem=10G 
#SBATCH --time=00:30:00


myarray=("UP000472266" "UP000007754""UP000018468""UP000694546""UP000694380""UP000002279""UP000008143""UP000472272""UP000694554""UP000001038""UP000007648""UP000472264""UP000694620""UP000472277""UP000011712")
for str in ${myArray[@]}; do
  wget https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/reference_proteomes/Eukaryota/$str/$str_.*.fasta.gz
done
