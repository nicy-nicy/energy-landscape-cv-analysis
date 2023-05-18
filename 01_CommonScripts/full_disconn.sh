#!/bin/bash
dir="/sharedscratch/nn320/cv_analysis_on_allDB"
mkdir -p $dir/fulldisconns
cd $dir/$1/
cat << EOF > dinfo
autorange
delta 1.0
minima min.data
ts ts.data
order_by_energy
EOF
disconnectionDPS
ps2pdf tree.ps tree.pdf
rm dinfo tree.ps disconnected
mv tree.pdf $dir/fulldisconns/"$1".pdf
