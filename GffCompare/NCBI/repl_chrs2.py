import os
import sys
import glob

# File paths
ID_MAPPING_FILE = "id_mapping.txt"  # File containing species names and IDs

# Check if the ID mapping file exists
if not os.path.isfile(ID_MAPPING_FILE):
    print(f"Error: ID mapping file not found: {ID_MAPPING_FILE}")
    sys.exit(1)

# Read the ID mapping file
with open(ID_MAPPING_FILE, 'r') as id_file:
    for line in id_file:
        # Parse the species name and ID from each row
        species_name, refseq_id = line.strip().split('\t')

        # Step 1: Find the TSP file for the species
        tsp_file = f"{species_name}_genome_seq_report.tsv"
        if not os.path.isfile(tsp_file):
            print(f"Error: TSP file not found for species {species_name}: {tsp_file}")
            continue

        # Step 2: Find the GFF3 file for the species
        species_folder = os.path.join(os.getcwd(), species_name)
        if not os.path.isdir(species_folder):
            print(f"Error: Folder not found for species {species_name}: {species_folder}")
            continue

        # Search for the "genomic.gff" file within the species folder
        gff3_pattern = os.path.join(species_folder, "ncbi_dataset", "data", "GCF_*", "genomic.gff")
        gff3_files = glob.glob(gff3_pattern)
        if not gff3_files:
            print(f"Error: GFF3 file not found for species {species_name} in {gff3_pattern}")
            continue
        gff3_file = gff3_files[0]  # Use the first match

        # Step 3: Prepare the output file name
        output_file = f"{species_name}_corrected.gff"

        # Step 4: Prepare a dictionary to map chromosome names from the TSP file
        chr_map = {}
        used_ids=[]
        with open(tsp_file, 'r') as tsp:
            for line in tsp:
                cols = line.strip().split('\t')
                old_id = cols[2]
                second_id = cols[1]
                new_id = cols[3]

                # Check if new_id is not "Un"
                if new_id != "Un" and new_id not in used_ids:
                    chr_map[old_id] = new_id
                    used_ids.append(new_id)
                else:
                    chr_map[old_id] = second_id

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