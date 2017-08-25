# Example code

A number of code samples have been prepared to demonstrate different type of PBS jobs.

## Demonstration workload

This repository contains a number of example Job scripts. Each job runs a [demo program](./compute_py) designed to calculate PI 
using a monte carlo simulation (possibly running on multiple CPUs across multiple nodes).

## Sample PBS jobs

Here are some examples of using PBS to run the [demo program](./compute_py) in various configurations on Raijin using PBS

1. [Simple single CPU batch job](./one_cpu)
1. Multiple CPUs, single node  -- TODO
1. Whole node (16 CPUs) -- TODO
1. [Multiple nodes](./multi_node) - simple internode communications via ``/short``
1. [Multiple nodes using MPI](./multi_node_mpi) - uses MPI to orchestrate cluster execution

## Monitoring jobs

Remember that you can monitor your PBS jobs using the ``qstat`` command. Refer to
 the [PBS command cheet sheet](https://opus.nci.org.au/display/Help/Raijin+Quick+Reference+Guide)

