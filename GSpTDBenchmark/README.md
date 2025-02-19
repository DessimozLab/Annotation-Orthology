Before running the benchmark, there are some pre processing steps to be done:
1) The prep_bs_from_omastandalone.drw script needs to be copied in the base directory of each OMA run

2) Subsequently, the next command should be run (once for each Annotation set), from the OMA run directory:
```
echo "ReadProgram('parameters.drw'); ReadProgram('prep_bs_from_omastandalone.drw');" | bin/omadarwin
```
--> This should render a new subdirectory (for_benchmarking) with 2 files and 1 symlink (Summaries.drw, ServerSeqs.db and ServerIndexed.db)

3) Create your repo from https://github.com/qfo/benchmark-webservice.git
4) Go to the generateData subdirectory of the benchmarking directory (the git repo) and export a QFO_REFSET_PATH to the directory of the OMA run you want to run the benchmark on, specifically to the subdirectory that we created in the previous step 2 (e.g. export QFO_REFSET_PATH=<pathto/OMAStandalone/run/for_benchmarking>)

5) Run:
 
```
python generate_json_mapping.py -e
```

This should generate mapping.json.gz within the for_benchmarking folder

6) If you are using a newick species tree, you will need also the file generate_speciestree_samples_silvia.py, which is provided in this repo (Annotation-Orthology/GSpTDBenchmark/filesforbenchmark) in the generateData directory. Alternatively, if the species tree is input as phyloxml simply use generate_speciestree_samples.py, which is the original file in the benchmark repo.
7) Then, run: 
```
python generate_speciestree_samples_silvia.py --tree-size 10 Luca --out $QFO_REFSET_PATH <pathto/OMAStandalone/run/SpeciesTree.nwk
```
Now you are ready to run the nextflow pipeline of the qfo_benchmark


For running the benchmark, you will need to use singularity or docker as it uses an external image (see nextflow.config).
The benchmark is run by running the nextflow main.nf file. First, you will need to:
1) change the $QFO_REFSET_PATH: export $QFO_REFSET_PATH=<pathto/OMAStandalone/run>
2) change the nextflow.config file to the one provided in this repo (Annotation-Orthology), which might need some further changes if you use docker instead of singularity.
A sample command for running the benchmark is the following.

```
nextflow run main.nf -profile singularity --results_dir ./obs_out --goldstandard_dir $QFO_REFSET_PATH/for_benchmarking/ --challenges_ids " G_STD2_Luca" --assess_dir ./reference_data/data --participant_id topEnsembl  --input $QFO_REFSET_PATH/Output/HierarchicalGroups.orthoxml
```

For running the benchmark on the OrthoFinder results, you need to obtain a 'Total.tsv' file which includes all the ortholog pairs for each annotation set, which you can do using the Jupyter notebook "OrthoFinder_adapt_benchmarking2". Then, export the QFO_REFSET_PATH to the corresponding OMA directory (e.g. if you are going to benchmark OrthoFinder's topEnsembl orthologues, you should export the path to the OMA top Ensembl run):

export $QFO_REFSET_PATH=<yourpath/to/OMAtopEnsemblrun/>

Next, to run the benchmark, use:

```
nextflow run main.nf -profile singularity --results_dir ./obs_out --goldstandard_dir $QFO_REFSET_PATH/for_benchmarking/  --challenges_ids " G_STD2_Luca" --assess_dir ./obs_out/results --participant_id topEnsemblOF --input </your/pathto/OrthoFinder/Results/Orthologues/Total.tsv>
```
