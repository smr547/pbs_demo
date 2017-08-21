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

Output files will come to the current directory. A typical PBS output file will look like 

```
Running trials 1000000000 on each of 16 core(s)
50265525168 16000000000 3.141595323

======================================================================================
                  Resource Usage on 2017-08-21 16:04:55:
   Job Id:             7920218.r-man2
   Project:            u46
   Exit Status:        0
   Service Units:      5.09
   NCPUs Requested:    16                     NCPUs Used: 16
                                           CPU Time Used: 04:55:46
   Memory Requested:   200.0MB               Memory Used: 71.18MB
   Walltime requested: 00:25:00            Walltime Used: 00:19:06
   JobFS requested:    10.0MB                 JobFS used: 541.0B
======================================================================================
```
