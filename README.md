# PBS examples for new starters at GA

## Introduction

Geoscience Australia (GA) stores large quantities of satellite data at the National Computer Infrastructure facilities located 
at ANU in Canberra.
From these data, GA produces a number of data products that are made available to customers via various publishing mechanisms.

The main computer at NCI is Raijin, a batch-processing super computer. The GA product production 
line employs Raijin and the Portable Batch System (also know as PBS) to submit batch jobs for processing on Raijin.

The purpose of this document is to give new starters at GA an quick introduction in how to write PBS jobs to run on Raijin. I've
provided some sample code and some tips on writing code and preparing jobs scripts. 

## Glossary of Terms
Here is a [glossary of terms](./glossary.md) to help get started with PBS. You should pay careful attention to the anti-terms
otherwise there is potential to waste time looking for PBS features that are not implemented avaialble on Raijin.

## Preliminary reading
NCI provide some excellent online documentation. Here is a list of [preliminary reading for new starters](./preliminary_reading.md).

## Design tips
Here is a collection of [design tips](raijin_pbs_tips.md) to help develop code to run on Raijin under PBS.

## Workload distribution Strategies
Read about different [workload distribution stratgies used by GA](workload_distribution_stategies.md).

## Example code
[Example code](./example_code.md) has been prepare to demonstrate some of the batch processing techniques used by GA

