#!/bin/bash
#PBS -P u46
#PBS -q express
#PBS -l walltime=00:10:00
#PBS -l mem=1GB
#PBS -l jobfs=1GB
#PBS -l ncpus=1
## The job will be executed from current working directory instead of home.
#PBS -l wd   

module load python3

# output goes to node local disk
OUTFILE=$PBS_JOBFS/pi_file_$$.txt

# run monte carlo trial
../compute_pi/compute.py 1000000 > $OUTFILE

# retuce output to ge value for PI
cat $OUTFILE | ../compute_pi/reduce.py
