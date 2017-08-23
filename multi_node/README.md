# Multi node PBS job

The script [two_node.pbs.sh](./two_node.pbs.sh) runs the [PI calculation program](../compute_pi/compute.py) on two 
standard Raijin node (comprising 32 CPUs).

## Job design

The strategy is to run 32 independent processes in parallel across the two nodes and quickly reduce their output. The script:

1. Computes and reports the number of cores available
1. Launches one process per core using the ``pbsdsh`` command, these processes run in parallel
1. Each process outputs a file to a common directory on ``/short``
1. Waits for all processes to finish
1. Collects all the output files on ``/short`` and runs their content through the [reduce program](../compute_pi/reduce.py)
1. outputs the value of pi on ``stdout``.

## Submitting the job

Submit the job directly from this directory:

```
qsub multi_node.pbs.sh
```

Output files will come to the current directory. A typical PBS output file will look like 

```
Running 10000000 on each of 32 core(s)
Launching on core 0
Launching on core 1
Launching on core 2
...
Launching on core 31
1005287316 320000000 3.1415228625 32 2

======================================================================================
                  Resource Usage on 2017-08-23 15:04:49:
   Job Id:             7978542.r-man2
   Project:            u46
   Exit Status:        0
   Service Units:      15.77
   NCPUs Requested:    32                     NCPUs Used: 32
                                           CPU Time Used: 00:05:06
   Memory Requested:   62.0GB                Memory Used: 0B
   Walltime requested: 00:10:00            Walltime Used: 00:29:34
   JobFS requested:    10.0MB                 JobFS used: 0B
======================================================================================
```
