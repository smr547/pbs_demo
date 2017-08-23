# Multi node PBS job using MPI

The script [two_node.pbs.sh](./two_node.pbs.sh) runs the [PI calculation program](../compute_pi/compute.py) on two 
standard Raijin node (comprising 32 CPUs). 

## Job design

The strategy is to run 32 independent processes in parallel across the two nodes and quickly reduce their output. The script:

1. Load the required MPI modules
1. Reports the number of cores available
1. Launches one process per core using the ``mpiexec`` command, these processes run in parallel
1. The program [compute_mpi.py program](../compute_pi/compute_mpi.py) handles the computation and reduction of results
1. outputs the value of pi on ``stdout``.

## Submitting the job

Submit the job directly from this directory:

```
qsub two_node.pbs.sh
```

Output files will come to the current directory. A typical PBS output file will look like 

```
TODO
```
