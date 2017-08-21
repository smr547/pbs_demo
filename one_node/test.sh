#!/bin/bash
START=1
END=5
for i in $(eval echo "{1..$END}")
do
   echo "$i"
done
