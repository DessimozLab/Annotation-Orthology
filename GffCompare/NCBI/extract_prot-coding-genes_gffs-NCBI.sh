#!/bin/bash
#SBATCH --job-name=NCBI-extprotcod     # Job name
#SBATCH --output=%x.log          # Standard output log
#SBATCH --error=%x.log            # Standard error log
#SBATCH --time=05:00:00              # Time limit (hh:mm:ss)
#SBATCH --ntasks=1                   # Number of tasks
#SBATCH --cpus-per-task=4            # CPU cores per task
#SBATCH --mem=30G                     # Memory per node - 1GB of gff file for human genome

# Loop through all *_corrected.gff files
for gff in *_corrected.gff; do
    gffbasename="${gff%.gff}"
    outfile="${gffbasename}_protein_coding.gff"
    echo "$gffbasename"
    if [ -f "$outfile" ]; then
        echo "Output file $outfile already exists. Skipping $gff..."
        continue
    fi

    echo "Processing $gff..."

    python - <<EOF
import os
import gffutils

gff = "$gff"
gffbasename = os.path.splitext(gff)[0]

db = gffutils.create_db(
    gff,
    dbfn=":memory:",
    merge_strategy="create_unique",
    keep_order=True
)

with open(gffbasename + "_protein_coding.gff", "w") as out:
    for gene in db.features_of_type("gene", order_by='start'):
        # Ciona's NCBI gff file has a problem: no protein_coding gene is annotated as protein_coding.
        # Therefore for this species we check if the gene has CDS sequences. Assume that if a gene has CDS sequences, it is protein_coding.
        if gffbasename == "Ciona_intestinalis_corrected":
            # Check if the gene has CDS sequences
            has_cds = any(
                child.featuretype == "CDS"
                for child in db.children(gene, level=None, order_by='start')
            )
            if has_cds:
                out.write(str(gene) + "\n")
                for child in db.children(gene, level=None, order_by='start'):
                    out.write(str(child) + "\n")
        else:
        #Default behavior for other species
            if gene.attributes.get("gene_biotype", [""])[0] == "protein_coding" or \
                gene.attributes.get("gbkey", [""])[0] == "protein_coding":
                out.write(str(gene) + "\n")
                for child in db.children(gene, level=None, order_by='start'):
                    out.write(str(child) + "\n")
EOF

done

