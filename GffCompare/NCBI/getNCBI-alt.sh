#!/bin/bash

# Path to the ID mapping file
ID_MAPPING_FILE="id_mapping.txt"

# Activate the conda environment
conda activate ncbi_datasets

# Read ID mapping file line by line
while IFS=$'\t' read -r new_filename original_id
do
    # Download the file and rename it using the new filename
    datasets download genome accession "$original_id" --filename "$new_filename.zip" --include gff3
    echo "Downloaded $original_id as $new_filename.zip"
done < "$ID_MAPPING_FILE"

