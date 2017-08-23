# PBS examples for new starters at GA

## Introduction

Geoscience Australia (GA) stores large quantities of satellite data on Raijin, the super computer at NCI. From these data, 
GA produces a number of data products that are made available to customers via various publishing mechanisms.

The main computer at NCI is Raijin, a batch processing super computer. The GA product production 
line employs Raijin and the Portable Batch System (also know as PBS) to submit batch jobs for processing on Raijin.

The purpose of this document is to give new starters at GA an quick introduction in how to write PBS jobs to run on Raijin.

## Preliminary reading

* [Raijin user guide](https://opus.nci.org.au/display/Help/Raijin+User+Guide)
* [Files an File System](https://opus.nci.org.au/display/Help/Raijin+User+Guide)
* [Job submission and scheduling](https://opus.nci.org.au/display/Help/Job+Submission+and+Scheduling)

## Example Job scripts

This repository contains a number of example Job scripts. Each job runs a [demo program](./compute_py) designed to calculate PI 
using a monte carlo simulation (possibly running on multiple CPUs across multiple nodes).

## Running PBS jobs

Here are some examples of using PBS to run the [demo program](./compute_py) in various configurations on Raijin using PBS

1. [Simple single CPU batch job](./one_cpu)
1. Multiple CPUs, single node
1. Whole node (16 CPUs)
1. [Multiple nodes](./multi_node) - simple internode communications

## Monitoring jobs

Remember that you can monitor your PBS jobs using the ``qstat`` command. Refer to
 the [PBS command cheet sheet](https://opus.nci.org.au/display/Help/Raijin+Quick+Reference+Guide)

