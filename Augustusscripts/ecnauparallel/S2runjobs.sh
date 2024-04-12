#!/bin/bash
  
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --array=1-3276
#SBATCH --partition=cpu
#SBATCH --mem 10G
#SBATCH -t 5:00:00
#SBATCH --job-name=ecnpaug
#SBATCH --output=array_%A-%a.out 
#SBATCH --output=array_%A-%a.out    # Standard output and error log


module load gcc augustus

./ecnauparallel/ECNAUaugjob_"${SLURM_ARRAY_TASK_ID}"
