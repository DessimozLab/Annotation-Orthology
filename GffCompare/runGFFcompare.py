import os
import sys
import subprocess
import glob

methods=["Ensembl", "NCBI", "Augustus"]
referencemethods=["Ensembl", "NCBI", "Augustus"]

missing_ref_files=[]
missing_query_files=[]

ID_MAPPING_FILE = "code-species.tsv"  # File containing species names and IDs
# Check if the ID mapping file exists

if not os.path.isfile(ID_MAPPING_FILE):
    print(f"Error: ID mapping file not found: {ID_MAPPING_FILE}", flush=True)
    sys.exit(1)


# Read the ID mapping file
with open(ID_MAPPING_FILE, 'r') as id_file:
    for line in id_file:
        # Parse the species name and ID from each row
        species_code, species_name = line.strip().split('\t')
        # Skip processing if the directory for the species already exists
        if os.path.exists(species_name):
            print(f"Directory for species '{species_name}' already exists. Skipping...", flush=True)
            continue
        
        #if directory species_name does not exist, create it
        elif not os.path.exists(species_name):
            os.makedirs(species_name)
       

        for ref in referencemethods:
            if ref == "NCBI" or ref == "Ensembl":
                ref_pattern = f"{ref}/{species_name}*.gff*"
            elif ref == "Augustus":
                ref_pattern = f"{ref}/{species_code}*.gff"
            ref_files = glob.glob(ref_pattern)
            if not ref_files:
                print(f"Error: No reference file found for pattern {ref_pattern}", flush=True)
                sys.stdout.flush()
                missing_ref_files.append(ref_pattern)
                continue
            REF_FILE = ref_files[0]  # Use the first match. Simply because the object is a list - not the best approach, but works
            
            for Method in methods:
                if Method == "NCBI" or Method == "Ensembl":
                    query_pattern= f"{Method}/{species_name}*.gff*"
                elif Method == "Augustus":
                    query_pattern = f"{Method}/{species_code}*.gff"
                query_files = glob.glob(query_pattern)
                if not query_files:
                    print(f"Error: No query file found for pattern {query_pattern}", flush=True)
                    sys.stdout.flush()
                    missing_query_files.append(query_pattern)
                    continue
                QUERY_FILE = query_files[0]  # Use the first match

                # Run gffcompare
                print(f"Starting GFFcompare for {species_name} {Method} vs {ref}", flush=True) 
                sys.stdout.flush()  
                subprocess.run(
                    "~/gffcompare-0.12.6/gffcompare "
                    "-r " f"{REF_FILE} "
                    "-o " f"{Method}-{ref} "
                    f"{QUERY_FILE} "
                , check=True, shell=True)

 
                # Path
                path = os.path.join(species_name, f"{Method}-{ref}")
                    
                # Create the directory 'ihritik'
                os.makedirs(path,exist_ok=True)
                
                subprocess.run(
                    f"mv {Method}-{ref}* {species_name}/{Method}-{ref}"
                , check=True, shell=True)
        

print("Missing reference files:", flush=True)

for ref_file in missing_ref_files:
    print(ref_file, flush=True)
    sys.stdout.flush()
print("Missing query files:", flush=True)
for query_file in missing_query_files:
    print(query_file, flush=True)
    sys.stdout.flush()
print("GFFcompare code finished for full gffs")

print("Starting process for protein-coding gffs")
# Now we want to process the protein coding gffs the same way

with open(ID_MAPPING_FILE, 'r') as id_file:
    for line in id_file:
        # Parse the species name and ID from each row
        species_code, species_name = line.strip().split('\t')
        species_dir = os.path.join("protein_coding", species_name)
        # Skip processing if the directory for the species already exists
        #if os.path.exists(species_dir):
        #    print(f"Protein coding directory for species '{species_name}' already exists: '{species_dir}'. Skipping.", flush=True)
        #    continue
        
        #if directory species_name does not exist, create it
        if not os.path.exists(species_dir):
            os.makedirs(species_dir)
            print(f"Directory created for species '{species_name}': '{species_dir}'", flush=True)

        for ref in referencemethods:
            if ref == "NCBI" or ref == "Ensembl":
                ref_pattern = f"{ref}/{species_name}*protein_coding*.gff*"
            elif ref == "Augustus":
                ref_pattern = f"{ref}/{species_code}*.gff"
            ref_files = glob.glob(ref_pattern)
            if not ref_files:
                print(f"Error: No protein-coding reference file found for pattern {ref_pattern}", flush=True)
                sys.stdout.flush()
                missing_ref_files.append(ref_pattern)
                continue
            REF_FILE = ref_files[0]  # Use the first match
            
            for Method in methods:
                if Method == "NCBI" or Method == "Ensembl":
                    query_pattern= f"{Method}/{species_name}*protein_coding*.gff*"
                elif Method == "Augustus":
                    query_pattern = f"{Method}/{species_code}*.gff"
                query_files = glob.glob(query_pattern)
                if not query_files:
                    print(f"Error: No query file found for pattern {query_pattern}", flush=True)
                    sys.stdout.flush()
                    missing_query_files.append(query_pattern)
                    continue
                QUERY_FILE = query_files[0]  # Use the first match

                # Run gffcompare
                comparison_dir=os.path.join(species_dir, f"{Method}-{ref}")
                if os.path.exists(comparison_dir):
                    print(f"Protein coding comparison for '{species_name}' and {Method}-{ref} already exists: '{comparison_dir}'. Skipping gffcomputation", flush=True)
                    continue
                else:
                    print(f"Starting GFFcompare for protein coding genes in {species_name} {Method} vs {ref}", flush=True) 
                    sys.stdout.flush()  
                    subprocess.run(
                        "~/gffcompare-0.12.6/gffcompare "
                        "-r " f"{REF_FILE} "
                        "-o " f"{Method}-{ref} "
                        f"{QUERY_FILE} "
                        , check=True, shell=True)

                    
                        # Create the directory comparison_dir and move the new files inside it
                    os.makedirs(comparison_dir, exist_ok=True)
                        
                    subprocess.run(f"mv {Method}-{ref}* {species_dir}/{Method}-{ref}", check=True, shell=True)
        

print("Missing reference files:", flush=True)
for ref_file in missing_ref_files:
    print(ref_file, flush=True)
    sys.stdout.flush()

print("Missing query files:", flush=True)
for query_file in missing_query_files:
    print(query_file, flush=True)
    sys.stdout.flush()
print("GFFcompare code finished for protein-coding gffs")

