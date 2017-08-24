# Tips for designing Raijin jobs

We often deal with very large, continental-scale datasets. So big workflows are a reality of working at GA. The good news is
our data is spinning on a super computer.  Here are some tips and guidelines in no particular order. 
They are intended to help the new starter avoid some pitfalls when
working with PBS on Raijin.

## Terms
I've tried to be accurate in my use of language -- Please refer to my [glossary of terms](./glossary.md). Now for the tips.

## Big jobs are better than small jobs
The Raijin PBS implimentation limits the number of jobs that can be subitted to a single queue from a single project
-- that limit is 200.
When designing a workflow try to break it up into large jobs. i.e. Jobs that process a lot of data (and that may require many nodes).

A workflow involving many small jobs is bad because:

* if the 200 job queue limit is exceeded, further ``qsub`` commands will fail
* if the 200 job queue limit is exceeded, all members of the project group will be impacted -- you will be unpopular
* there is an overhead in job setup and teardown

Workload homogenity is your goal (see below).

## Job script only runs on head node
When PBS has assembled the cluster of nodes to run your job it will launch your job script as a single process on the head node.
How your job uses the resources available to it is entirely guided by your job script. Since your aim is to utilise all cores and 
nodes availabe to you adopt one or more [strategies for distributing workload](workload_distribution_stategies.md) across those nodes.

## Watch your process memory size
A standard Raijin node is equipped with 16 cores and 32 GB of RAM. It is also a hard reality that PBS job monitor
will kill any job that asks for more memory than that available to the job *on any one node*.  

This leads to the following rules of thumb

1. Run a maximum of 16 processes in parallel on any one node
1. Keep your memory requirement below 2GB per process 

More generally 

* measure the maximum memory working set size of your process (lets call it PWSS_GB)
* maximum number of processes per node ``MAX_PPN = min(floor(32/PWSS_GB), 16)``

These rules assume that all a job's processes are mostly identical in terms of their anticipated memory footprint.

## Choose the number of CPUs carefully (a)

Job resource requirements are declared using ``#PBS...`` directives at the top of the job script (these may also be overriden
by ``qsub`` command line options. The most important resource parameter is ``NCPUS``

* Get to know your processes so you can anticipate the likely runtime given a typical workload
* beware that there are maximum wallclock times for jobs. These vary depending on the queue. 
* A typical limit is 48 hours on the ``normal`` queue. Jobs exceeding this limit will be killed, so

Specify a sufficently large ``NCPUS`` value to allow your workload to be processed within the limits of the queue.

## Choose the number of CPUs carefully (b)
Very small jobs running on one node may specify ``NCPUS`` from 1 to 16 inclusive. If your job requires more than 16 CPUs 
you should allocate two or more ''whole nodes''. That is, your value for ``NCPUS`` should be a multiple of 16. 

## Keep other resources consistent with NCPUS
PBS will muster sufficient nodes into a cluster to satisfy the maximum resource requirements of the Job. You may need only 4 CPUs
but if you ask for 32GB of memory you will be given exclusive use of one node with 16 available CPUs. 
Natrually, if you are only using 4 CPUs, then 12 CPUs will remain idle (and your CPU utilisation will be noticeably bad).

Here are some rules of thumb for using standard nodes on Raijin

* Maximum Memory requirement in GB ``mem = 31 * NCPUS / 32``
* Maximum JOBFS requirement in GB ``jobfs = 200 * NCPUS / 32``
* Walltime - allow enough time for your job to finish with a safety margin. Stay within queue limits

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

## Measure memory requirements with augmented loggin
Here is some sample code that allows memory usage information to be appended to each log message generate by a Python program. 
This can be very helpful when trying to assess the real memory requirements of your pocess. 

TODO -- find the code!

## Other reading

1. [Stack overflow article](https://stackoverflow.com/questions/5453427/does-a-pbs-batch-system-move-multiple-serial-jobs-across-nodes) about invoking processes across multi-node PBS jobs.
1. [Raijin Essentials (PDF)](http://nci.org.au/wp-content/uploads/2015/06/Raijin-Essentials.pdf)
1. [Job submission and scheduling FAQs](https://opus.nci.org.au/display/Help/Job+Submission+and+Scheduling)
1. [Submitting an array of jobs across nodes](https://opus.nci.org.au/display/Help/How+do+I+submit+array+jobs+on+raijin)
