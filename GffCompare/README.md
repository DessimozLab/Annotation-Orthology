Before running GffCompare, there are some steps to be completed:
1. Correct the NCBI chromosome names:

- 1.1. First, use "download_seq_report.sh" to get all the genomes seq reports.
- 1.2. Run "repl_chrs2.py". This will output "corrected" versions of the downloaded gff files with extension "_corrected.gff"

2. Filter the _corrected.gff's to contain only protein coding genes, using: "extract_prot-coding-genes_gffs-NCBI.sh" and "extract_prot-coding-genes_gffs-Ensembl.sh" . The output files will have the extension "_protein_coding.gff".

3. Use the "Check_genes_matching_transcripts.ipynb" to filter the NCBI gffs to only primary_assembly genes (Ensembl and Augustus gffs only have primary assembly genes).

4. Run GffCompare, using "send-runGFFcompare.sh", which launches "runGFFcompare.py".

5. Calculate Jaccard Indexes and make figure 3 using the notebook "Check_genes_matching_transcripts.ipynb" again, which uses GffCompare's .tracking files.
