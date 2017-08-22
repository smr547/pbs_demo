# Tips for designing Raijin jobs

## Watch you process memory size
A standard Raijin node is equipped with 16 cores and 32 GB of RAM. It is also a hard reality that PBS job monitor
will kill any job that asks for more memory than that available to the task.  

This leads to the following rules of thumb

1. Run a maximum of 16 processes in parallel on any one node
1. Keep your memory requirement below 2GB per process 

More generally 

* measure the maximum memory working set size of your process (lets call it PWSS_GB)
* maximum number of processes per node ``MAX_PPN = min(floor(32/PWSS_GB), 16)``

These rules assument that all the processes running mostly identical in terms of their anticipated memory footprint.

## Choose the number of CPUs


## Keep your workload homogenous

In discussing resource here I''m referring to CPU, Memory and walltime. Some important things to remember about PBS:

* The resources allocated to a PBS job is fixed at Job submission time. 
* An executing PBS job is *inflexible*
** more resources cannot be added (even if needed)
** a job demanding more than the allocated resources will be killed -- processed data may be lost
** with the exception of walltime, unused resources cannot be give up as *not required*

For big tasks requiring many nodes this inflexibility may have a profound impact on how you design your workflow. For example, in
a big Map/Reduce workflow you might use a ``MapJob`` followed by a ``ReduceJob``. The ``MapJob`` might require 
many nodes executing long running processes while the ``ReduceJob`` might require fewer jobs but might also run 
for a modest amount of time.

If the two jobs were to be combined into a single job, many nodes may be underutilised during the reduce phase, 
thus leading to greater cost for the workflow. In this case it would be more economical to keep the 
``MapJob`` and the  ``ReduceJob`` as separate PBS jobs to be run in sequence.

L.S.Lowe elegantly describes this issue in the last two paragraphs of [this article](http://www.ep.ph.bham.ac.uk/general/support/torquepbsdsh.html)

## Experiment with your jobs scripts

Experiment with your job scripts to guage memory usage, run time, CPU utilisation and to find bugs. One great way to
test the job script is to use an interactive batch session.

## Interactive batch session

An interactive batch session is where you submit a batch job with the ``-I`` option and no ``job script`` specified.

```
qsub -I -q express -l NCPUS=32,MEM=61GB
```
 
Once your job starts you will be given interactive access to a shell on the head node of the ``node cluster`` that 
has been allocated to your job (in this case, 2 nodes). You can then test the execution of your script by 

1. changing to the working directory of the job
2. typing the ``job script`` name on the command line

This emulates exactly what ``PBS`` does when it runs your job.

You are going to get the best results by submitting your job to the ``express`` queue. But beware: ``express`` queue jobs
are billed at three times the normal job rate. So use with care and close the session (ctrl-D) as soon as possible.

## Other resources

1. [Stack overflow article](https://stackoverflow.com/questions/5453427/does-a-pbs-batch-system-move-multiple-serial-jobs-across-nodes) about invoking processes across multi-node PBS jobs.
1. [Raijin Essentials (PDF)](http://nci.org.au/wp-content/uploads/2015/06/Raijin-Essentials.pdf)
1. [Job submission and scheduling FAQs](https://opus.nci.org.au/display/Help/Job+Submission+and+Scheduling)
1. [Submitting an array of jobs across nodes](https://opus.nci.org.au/display/Help/How+do+I+submit+array+jobs+on+raijin)
