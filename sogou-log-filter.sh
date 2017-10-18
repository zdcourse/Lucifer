#!/bin/bash
infile=$1
outfile=$2
awk -F "\t" '{if($2 != "" && $3 != "" && $2 != " " && $3 != " ") print $0}' $infile > $outfile

