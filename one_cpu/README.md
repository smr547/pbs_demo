# Single CPU PBS job

The script [one_cpu.pbs.sh](./one_cpu.pbs.sh) runs the [PI calculation program](../compute_pi/compute.py) on one CPU.
This program outputs to the hard disk local to node on which the job is running. 
It then runs the [reduce program](../compute_pi/reduce.py) and outputs the value of pi.

## Submitting the job

Submit the job directly from this directory:

```
qsub one_cpu.pbs.sh
```

Output files will come to the current directory.
