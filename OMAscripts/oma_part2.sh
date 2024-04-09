#!/bin/bash
  
#SBATCH --account=cdessim2_default
#SBATCH --array=1-500
#SBATCH --partition=cpu
#SBATCH --time=7:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=5GB
#SBATCH --job-name=oma2
#SBATCH --output=logs/%A.%a.log
#SBATCH --export=None
#SBATCH --error=logs/oma2-%A.%a.err

cd /Annotation-Orthology/OMA/OMAtopNCBI20
export NR_PROCESSES=500

bin/oma -s -W 7000
if [[ "$?" == "99" ]] ; then
    scontrol requeue ${SLURM_ARRAY_JOB_ID}_${SLURM_ARRAY_TASK_ID}
fi
exit 0
