#!/usr/bin/env python
#
# compute PI using a monte carlo simulation
#
# usage: ./compute.py <trials>
# output: fraction_in_unit_circle trial pi_calculated PID hostname
#============================================

from __future__ import print_function
import random
import sys
# import socket
# import os
import numpy
from mpi4py import MPI


def pi_fraction(n):
    return 4 * sum(1 for _ in range(n) if random.random()**2 + random.random()**2 < 1)

if __name__ == "__main__":
    n = int(sys.argv[1])
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    counts = numpy.zeros(2)
    totals = numpy.zeros(2)
    counts[0] = n 
    counts[1] = pi_fraction(n)
    comm.Reduce(counts, totals, op=MPI.SUM, root=0)
    if comm.rank == 0:
        print(totals[0], totals[1], totals[1]/totals[0])
        
    
#    m = pi_fraction(n)
#    hostname = socket.gethostname()
#    pid = os.getpid()
#    print (pi_fraction(n), n, m/n, pid, hostname) 
    
