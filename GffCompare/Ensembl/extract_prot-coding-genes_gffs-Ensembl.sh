#!/bin/bash
#SBATCH --job-name=Ensembl-extprotcod     # Job name
#SBATCH --output=%x.log          # Standard output log
#SBATCH --error=%x.log            # Standard error log
#SBATCH --time=05:00:00              # Time limit (hh:mm:ss)
#SBATCH --ntasks=1                   # Number of tasks
#SBATCH --cpus-per-task=4            # CPU cores per task
#SBATCH --mem=30G                     # Memory per node - 1GB of gff file for human genome

# Loop through all *_corrected.gff files
for gff in *.gff3; do
    gffbasename="${gff%.gff3}"
    outfile="${gffbasename}_protein_coding.gff3"

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

with open(gffbasename + "_protein_coding.gff3", "w") as out:
    for gene in db.features_of_type("gene", order_by='start'):
        attrs = gene.attributes
        biotype = (
            attrs.get("gene_biotype", []) +
            attrs.get("gbkey", []) +
            attrs.get("biotype", [])
        )
        if "protein_coding" in biotype:
            out.write(str(gene) + "\n")
            for child in db.children(gene, level=None, order_by='start'):
                out.write(str(child) + "\n")

EOF

done

