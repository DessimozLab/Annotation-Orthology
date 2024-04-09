#!/bin/bash
#SBATCH --job-name=download
#SBATCH --time=4:00:00

array=('homo_sapiens' 'mus_musculus' 'danio_rerio' 'ciona_intestinalis' 'strigops_habroptila' 'taeniopygia_guttata' 'lepisosteus_oculatus' 'gadus_morhua' 'chrysemys_picta_bellii' 'ornithorhynchus_anatinus' 'xenopus_tropicalis' 'podarcis_muralis' 'phocoena_sinus' 'oryzias_latipes' 'sarcophilus_harrisii' 'echeneis_naucrates' 'erpetoichthys_calabaricus' 'salmo_trutta' 'felis_catus' 'gallus_gallus')
array2=(97 102 106 108 108 108 108 108 108 108 108 108 108 108 108 108 108 108 108 102)

for i in "${!array[@]}"; do

rsync  -av rsync://ftp.ensembl.org/ensembl/pub/release-"${array2[i]}"/fasta/"${array[i]}"/dna/*dna_sm.primary_assembly.fa.gz ./"${array[i]}".dna_sm.primary_assembly.fa.gz

done

for i in "${!array[@]}"; do
	if [[ -f "${array[i]}".dna_sm.primary_assembly.fa.gz ]]
	then
		echo "${array[i]}" "has a primary assembly"
	else
		rsync  -av rsync://ftp.ensembl.org/ensembl/pub/release-"${array2[i]}"/fasta/"${array[i]}"/dna/*dna_sm.toplevel.fa.gz ./"${array[i]}".dna_sm.toplevel_assembly.fa.gz
	fi

done
