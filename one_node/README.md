# One node PBS job

The script [one_node.pbs.sh](./one_node.pbs.sh) runs the [PI calculation program](../compute_pi/compute.py) on one 
standard Raijin node (comprising 16 CPUs).

## Job design

The strategy is to run 16 independent processes in parallel on the one node and quickly reduce their output. The script:

1. Computes and reports the number of cores available
1. Launches 16 independent processes that run in parallel
1. Each process outputs to a file on the node's local hard disk (via ``$PBS_JOBFS``)
1. Waits for all processes to finish
1. Collects all the output files and runs their content through the [reduce program](../compute_pi/reduce.py)
1. outputs the value of pi on ``stdout``.

## Submitting the job

Submit the job directly from this directory:

```
qsub one_node.pbs.sh
```

Output files will come to the current directory.
