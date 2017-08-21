#!/bin/bash
#PBS -P u46
#PBS -q normal
#PBS -l walltime=00:25:00
#PBS -l mem=200MB
#PBS -l jobfs=10MB
#PBS -l ncpus=16
## The job will be executed from current working directory instead of home.
#PBS -l wd   

module load python3

TRIALS=1000000000
# determine the number of cores
CORES=$(wc -l $PBS_NODEFILE | awk '{print $1}')
echo "Running $TRIALS on each of $CORES core(s)"

# run one process for each core
start=1
for p in $(eval echo "{1..$CORES}")
do
    OUTFILE=$PBS_JOBFS/$p.txt

    # run monte carlo trial
    ../compute_pi/compute.py $TRIALS > $OUTFILE &
done

# wait for all processes to finish
wait 

# retuce output to get final value for PI
cat $PBS_JOBFS/*.txt | ../compute_pi/reduce.py
