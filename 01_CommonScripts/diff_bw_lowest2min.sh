#!/bin/bash

# input file requirement:  $dir/$1/

dir="/sharedscratch/nn320/cv_analysis_on_allDB"
dirname=$1
cd $dir/$1/
# awk '{print NR, $1}' min.data | sort -k 2n | head -n 2 | awk '{print $1,$2}' | head -n 1
globalmin=$(sort -k 1n min.data | head -n 2 | awk '{print $1}' | head -n 1)
secondlowest=$(sort -k 1n min.data | head -n 2 | awk '{print $1}' | tail -n 1)
# echo $globalmin
# echo $secondlowest
diff=$(echo "$globalmin - $secondlowest" | bc)
echo "$1 $diff" >> $dir/diffbwLowest2
cd $dir
