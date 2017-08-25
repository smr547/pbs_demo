#!/bin/bash
#PBS -P u46
#PBS -q normal
#PBS -l walltime=00:10:00
#PBS -l mem=62GB
#PBS -l jobfs=10MB
#PBS -l ncpus=32
## The job will be executed from current working directory instead of home.
#PBS -l wd   

# Run PI calculations in parallel -- one process for each available CPU
# and then reduce the results to a single value

module load openmpi/1.6.3
module load python/2.7.3
module load mpi4py/1.3.1

# run one process for each core
TRIALS=10000000
echo "Running $TRIALS on each of $PBS_NCPUS core(s)"

mpiexec -n $PBS_NCPUS python ../compute_pi/compute_mpi.py $TRIALS
