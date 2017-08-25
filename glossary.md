# Glossary of PBS Terms

The following is a list of terms used when talking about PBS and job processing on Raijin.

* ``Workflow`` - a collection of PBS jobs run in sequence, in parallel or any combination of both for the purpose of completing 
a data processing product
* ``Job`` - A PBS job run on Raijin in batch mode
* ``Workload`` - the data processing performed by a job
* ``Processor`` - a CPU core. Raijin has over 80,000 of them
* ``Core`` - see ``Processor``
* ``Node`` - A single computer in the Raijin super-computer -- most commonly consisting of 
16 CPU cores, 32GB RAM, 200GB spinning disk and a connection to the 56Gbps Infiniband network
* ``Cluster`` - a group of nodes working together to process one job
* ``Head node`` - the first node in the cluster -- your job script will start running on this (and only this) node
* ``Project`` - a billing entity (maps directly to a Unix group on Raijin)
* ``Process`` - a Unix process running on one node
* ``Queue`` - PBS jobs are submitted to a queue and they wait their until released for execution by the PBS scheduler. See the 
PBS documentation for more details on ``queues``
* ``CPU utilisation`` - the percentage of available CPU actually used by a Job''s processes measured across the entire cluster
* ``NCPUS`` - A PBS resource specification (and environment variable) describing the total number of cores allocated to a Job
* ``jobfs`` - Job file system is storage space allocated to a job. Environment variable ``PBS_JOBFS`` will point to the top
level directory. The storage space is distributed. It resides on the spinning disk aboard each node allocated to the job
* ``Job script`` -- The script (or shell command) being executed by a job. This is typically a ``bash script``

## Anti-terms

Beware of [term that may cause confusion](./glossary_anti_terms.md)

