# Glossary of PBS Terms

The following is a list of terms used when talking about PBS and job processing on Raijin.

* Workflow - a collection of PBS jobs run in sequence or in parallel (or any combination of both) for the purpose of completing 
a data processing product
* Job - A PBS job run on Raijin in batch mode
* Workload - the data processing performed by a job
* Processor - a CPU core
* Node - A single computer in the Raijin super-computer -- most commonly consisting of i
16 CPU cores, 32GB RAM, 200GB spinning disk and a connection to the 56Gbps Infiniband network
* VNode - PBS concept that seems poorly defined. We avoid that term
* Cluster - a group of nodes working together to process one job
* Project - a billing entity (maps directly to a Unix group on Raijin)
* Process - a Unix process running on one node
* CPU utilisation - the percentage of available CPU actually used by a Job''s processes measured across the entire cluster

## Anti-terms

PBS is very configurable and each deployment introduces terms that may be unique to a particular environment. The downside is
that there is PBS documentation on the web which can be confusing and misleading. Some terms to watch out for

* VNode -- this is a nebulous term that has a very vague definition in the PBS manual. Until somebody can give a coherent 
definition of what a VNode means on Raijin
* VNODENUM -- an environment variable automatically set by some PBS deployments. As far as the author can tell ``VNODENUM`` is
not defined on Raijin PBS jobs and documents that describe it''s use should be ignored. ``VNODENUM`` is not available to us.
* VTASKNUM -- see ``VNODENUM``
