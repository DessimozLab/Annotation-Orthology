#!/bin/bash
  
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --array=1-3276
#SBATCH --partition=cpu
#SBATCH --mem 10G
#SBATCH -t 5:00:00
#SBATCH --job-name=salpaug
#SBATCH --output=array_%A-%a.out 
#SBATCH --output=array_%A-%a.out    # Standard output and error log


module load gcc augustus

/work/FAC/FBM/DBC/cdessim2/default/sprietob/assemblies20/salparallel/SALTRaugjob_"${SLURM_ARRAY_TASK_ID}"
