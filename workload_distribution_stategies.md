# Workload distribution stategies

Your job script starts executing on the head node of the cluster of nodes allocated to you by PBS. What next?

There are a number of different ways of using the cores available to you

* loop and background  -- see the [Simple single CPU batch job](./one_cpu) and [Whole node (16 CPUs)](./one_node) examples
* gnu parallel -- TODO
* PBS distributed shell -- see [Multiple nodes](./multi_node)
* MPI -- [Multiple nodes using MPI](./multi_node_mpi)
* [Luigi](https://github.com/spotify/luigi) -- TODO
* Executor -- TODO

You choice will be guided by the workload you are processing,  the workflow context of the Job and the way the software processes 
have been written.

## TODO
Different teams have approached this problem in different ways. New techniques are being developed all the time.

It would be great to do a quick survey of all the approaches and document them briefly here. I believe that is will be useful 
to all GA developers and managers, not just the new starters
