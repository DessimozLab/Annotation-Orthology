Bellow there is a summary of the notebooks outputs and necessary inputs. We provide the code to produce the tables used in the analyses and in figures constructions. There are some cases in which these takes a long time. We also provide precomputed tables to run the code more quickly in the Tables subdirectory of this repo.
In some cases, trees are also needed. These can be found in the Trees subdirectory.

Check the following notebooks to produce the specified files:
1) Genelength_notebook
CanonicalProteinsLength3_correction.csv
NonOrthologous-Canonical-Proteins_length.csv
Orthologous-Canonical-Proteins_length.csv
ProtLengthStats_canonical_4methods_2.csv

Figure S6 
Figure 6
Figure S7
Figure S8

2)	Stats-counts
Figures: 1, 2 and 3
Statsmerge.csv
Ortholog_numbers.csv
NumberofGenes_stats.csv
(Inputs: ProtLengthStats_canonical_4methods_2.csv, species20tree.nwk, cladogram20species.nwk)

3)	Augustus_explanatory_analysis
Figures S1, S2 and S3
(Inputs: Statsmerge.csv and Species_info_paper.csv. The latter was manually done)

4)	HOGs_analyses-figures
Figures: 4 and S4
HOGsizestats.csv
HOGstats.csv
HOGstatsinv.csv

(Inputs: species_tree_withname.nwk, ProtLengthStats_canonical_4methods_2.csv)
