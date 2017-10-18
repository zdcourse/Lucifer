#!/bin/bash
infile=$1
outfile=$2
awk -F '\t' '{print $0"\t"substr($1,0,4)"\t"substr($1,4,2)"\t"substr($1,6,2)"\t"substr($1,8,2)}' $infile > $outfile


