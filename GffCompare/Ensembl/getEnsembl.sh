#!/bin/bash

array=('homo_sapiens' 'mus_musculus' 'danio_rerio' 'ciona_intestinalis' 'strigops_habroptila' 'taeniopygia_guttata' 'lepisosteus_oculatus' 'gadus_morhua' 'chrysemys_picta_bellii' 'ornithorhynchus_anatinus' 'xenopus_tropicalis' 'podarcis_muralis' 'phocoena_sinus' 'oryzias_latipes' 'sarcophilus_harrisii' 'echeneis_naucrates' 'erpetoichthys_calabaricus' 'salmo_trutta' 'felis_catus' 'gallus_gallus')
array2=(97 102 106 108 108 108 108 108 108 108 108 108 108 108 108 108 108 108 108 102)


for i in "${!array[@]}"; do
    species="${array[i]}"
    ensembl_version="${array2[i]}"

    # Capitalize the first letter of the species name
    capitalized_species="$(echo "$species" | sed 's/^./\U&/')"

    # Construct the pattern dynamically
    rsync -av --include="*/" --include="${capitalized_species}.*.${ensembl_version}.gff3.gz" --exclude="*" \
        rsync://ftp.ensembl.org/ensembl/pub/release-"$ensembl_version"/gff3/"$species"/ ./
done
