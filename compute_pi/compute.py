#!/usr/bin/env python
#
# compute PI using a monte carlo simulation
#
# usage: ./compute.py <trials>
#============================================

import random
import sys


def pi_fraction(n):
    return 4 * sum(1 for _ in range(n) if random.random()**2 + random.random()**2 < 1)

if __name__ == "__main__":
    n = int(sys.argv[1])
    m = pi_fraction(n) 
    print (pi_fraction(n), n, m/n) 
    
