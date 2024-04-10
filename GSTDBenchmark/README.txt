Before running the benchmark, the prepr_bs_from_omastandalone.drw script needs to be copied in the base directory of each OMA run and subsequently, the next command need to be run:
echo "ReadProgram('parameters.drw'); ReadProgram('prep_bs_from_omastandalone.drw');" | bin/omadarwin

This should render a new subdirectory (for_benchmarking) with 2 files and 1 symlink (Summaries.drw, ServerSeqs.db and ServerIndexed.db)
