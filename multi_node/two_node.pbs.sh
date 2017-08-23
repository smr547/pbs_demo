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


# output will be collected in one directory on short 
OUTDIR=`mktemp -d --tmpdir=/short/u46/smr547/tmp`

# run one process for each core
TRIALS=10000000
echo "Running $TRIALS on each of $PBS_NCPUS core(s)"

for core_no in $(eval echo "{0..$(($PBS_NCPUS-1))}")
do
    OUTFILE=$OUTDIR/output_$core_no.txt

    # run the monte carlo simulation on the selected CPU
    echo "Launching on core $core_no"

    # warning -- ``pbsdsh`` stdout and stderr cannot be redirected
    pbsdsh -n $core_no -- /bin/bash -c "cd $PWD; ../compute_pi/compute.py $TRIALS > $OUTFILE" &
done

# wait for all processes to finish
wait 

# reduce all output files to get final value for PI
# IF the reduction step is long running consider using another JOB

cat $OUTDIR/*.txt | ../compute_pi/reduce.py

# remove the tempory output directory
rm -rf $OUTDIR
