#!/usr/bin/env python
#
# Read multiple "<trials> <pi_fraction> [<pi>]" records
# summing <trials> and <pi_fraction>s and ouputing 
# Output  "<total trials> <total pi_fraction> <computeed pi> process count host_count" record

import sys

trials = 0
process_count = 0
pi_fractions = 0
hosts = {}
for line in sys.stdin:
   fields = line.split(' ')
   trials += int(fields[0])
   pi_fractions += int(fields[1])
   process_count += 1
   hosts[fields[4]] = 1

print(trials, pi_fractions, trials/pi_fractions, process_count, len(hosts))

