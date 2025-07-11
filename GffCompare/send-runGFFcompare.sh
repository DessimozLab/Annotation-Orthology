#!/bin/bash
#SBATCH --job-name=gffcomparepython     # Job name
#SBATCH --output=%x.log          # Standard output log
#SBATCH --error=%x.log            # Standard error log
#SBATCH --time=04:00:00              # Time limit (hh:mm:ss)
#SBATCH --ntasks=1                   # Number of tasks
#SBATCH --cpus-per-task=4            # CPU cores per task
#SBATCH --mem=8G                     # Memory per node

# Log the start time
echo "Job started at: $(date)" > time.log

# Run Python script and capture all output (Python + External software)
python runGFFcompare.py > GFFcompare_python.log 2>&1 | tee GFFcompare_python.log

echo "Job finished at: $(date)" >> time.log
