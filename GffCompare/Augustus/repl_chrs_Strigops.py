import os
import sys
import glob



# Define species_name (choose one of the methods above)
species_name = input("Enter the species name: ")
        
    # Search for the "genomic.gff" file within the species folder
gff3_pattern = f"{species_name}*.gff"
gff3_files = glob.glob(gff3_pattern)

gff3_file = gff3_files[0]  # Use the first match

# Search for the "chromosome ID changes" file where the filename starts with the species_name
tsp_pattern = f"{species_name}*.tsv"
tsp_files = glob.glob(tsp_pattern)
tsp_file = tsp_files[0]

# Step 3: Prepare the output file name
output_file = f"{species_name}_corrected.gff3"

# Step 4: Prepare a dictionary to map chromosome names from the TSP file
chr_map = {}
with open(tsp_file, 'r') as tsp:
    for line in tsp:
        cols = line.strip().split('\t')
        outdated_id = cols[0]
        correct_id = cols[1]

        chr_map[outdated_id] = correct_id


# Step 5: Process the GFF3 file and replace chromosome names
with open(gff3_file, 'r') as gff3, open(output_file, 'w') as output:
    for line in gff3:
        if line.startswith('##'):  # Keep header lines unchanged
            output.write(line)
        else:
            cols = line.strip().split('\t')
            chr_id = cols[0]
            if chr_id in chr_map:
                cols[0] = chr_map[chr_id]  # Replace chromosome ID
            output.write('\t'.join(cols) + '\n')

print(f"Processed {species_name}: Output written to {output_file}")
