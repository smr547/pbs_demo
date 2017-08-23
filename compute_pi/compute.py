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
import socket
import os


def pi_fraction(n):
    return 4 * sum(1 for _ in range(n) if random.random()**2 + random.random()**2 < 1)

if __name__ == "__main__":
    n = int(sys.argv[1])
    m = pi_fraction(n)
    hostname = socket.gethostname()
    pid = os.getpid()
    print (pi_fraction(n), n, m/n, pid, hostname) 
    
