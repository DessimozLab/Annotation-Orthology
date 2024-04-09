#!/bin/bash

DataList="GCF_000001405.38,GCF_000001635.26,GCF_000002035.6,GCF_000002315.6,GCF_000224145.1,GCF_004027225.1,GCF_003957565.1,GCF_000242695.1,GCF_902167405.1,GCF_000241765.3,GCF_004115215.1,GCF_000004195.4,GCF_004329235.1,GCF_008692025.1,GCF_002234675.1,GCF_902635505.1,GCF_900963305.1,GCF_900747795.1,GCF_901001165.1,GCF_000181335.3"
Field_Separator=$IFS

conda activate ncbi_datasets
#set comma as internal field separator for the string list: DataList
IFS=,
for val in $DataList;
do
	datasets download genome accession $val --filename $val.zip --include gff3
	echo submited $val
done

IFS=$Field_Separator
