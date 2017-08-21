#!/bin/bash
#PBS -P u46
#PBS -q express
#PBS -l walltime=00:25:00
#PBS -l mem=100MB
#PBS -l jobfs=10MB
#PBS -l ncpus=1
## The job will be executed from current working directory instead of home.
#PBS -l wd   

module load python3

# determine the number of cores
CORES=$(wc -l $PBS_NODEFILE | awk '{print $1}')
TRIALS=1000000000
echo "Running $TRIALS on each of $CORES core(s)"

# run monte carlo trial outputing to local hard disk

OUTFILE=$PBS_JOBFS/pi_file_$$.txt
../compute_pi/compute.py $TRIALS > $OUTFILE

# retuce output to ge value for PI
cat $OUTFILE | ../compute_pi/reduce.py
