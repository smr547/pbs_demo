# Preliminary reading

NCI provide some excellent online documentation that covers the use of PBS on Raijin. 

* [Raijin user guide](https://opus.nci.org.au/display/Help/Raijin+User+Guide)
* [Files an File System](https://opus.nci.org.au/display/Help/Raijin+User+Guide)
* [Job submission and scheduling](https://opus.nci.org.au/display/Help/Job+Submission+and+Scheduling)

This material is necessary reading for any new starter at GA. The notes I've prepared here assume that the reader is
familiar with these documents.

## ``man`` pages
Check out ``man`` pages for the following PBS commands:

* ``qsub`` -- submit a job
* ``qdel`` -- to remove a queued job or kill it if it's executing
* ``qstat`` -- to get stats about a job
* ``qcat`` --  to view ``stdout`` and ``stderr`` of an exeuting job

## Manuals
Extensive reference material is also available 

* [PBS Professional User's Guide](http://www.pbsworks.com/pdfs/PBSUserGuide13.0.pdf)
* [PBS Professional Reference Guide](http://www.pbsworks.com/pdfs/PBSReferenceGuide13.0.pdf)
* [PBS Professional Administrator's Guide](http://www.pbsworks.com/documentation/support/PBSProAdminGuide12.pdf)

## Other ``man`` pages
```
man pbs_job_attributes
man pbs_server_attributes
man pbs_resources
man qalter
man qhold
man qmove
man qmsg(1B)
man qrerun
man qrlsi
man qselection
```

## Web reading
There is a wealth of material available on the web if you Google "PBS". Beware that the Raijin implementation of
PBS may be a little different from other installions. While reading material not authored at 
NCI or GA, beware of [Anti terms](./glossary_anti_terms.md) and avoid confusion.

