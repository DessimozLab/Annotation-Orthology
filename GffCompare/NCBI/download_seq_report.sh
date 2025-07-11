#!/bin/bash

ID_MAPPING_FILE="id_mapping.txt"

while IFS=$'\t' read -r new_filename original_id
do
    # Download the file and rename it using the new filename
    datasets summary genome accession "$original_id" --report sequence --as-json-lines | \
	dataformat tsv genome-seq --fields accession,genbank-seq-acc,refseq-seq-acc,chr-name > "$new_filename"_genome_seq_report.tsv
done < "$ID_MAPPING_FILE"
