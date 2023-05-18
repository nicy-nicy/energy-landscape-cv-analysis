#!/bin/bash
cd /sharedscratch/nn320/cv_analysis_on_allDB/$1/full_cv/disconn/
cat << EOF > dinfo
first dummy
maxtsenergy dummy
levels 26
delta 0.5
minima min.data
ts ts.data
monotonic
order_by_energy
lowest 2610
identify
scalebar 2
EOF
globalmin=$(sort -k 1n min.data | head -n 1 | awk '{print $1}')
topvalue=$(echo "$globalmin + 12.0" | bc)
sed -i "s/dummy/$topvalue/g" dinfo
disconnectionDPS > di
sed -i "s/(    1.00)/(    $1)/g" tree.ps
mv tree.ps identify"$1".ps
#cat << EOF > dinfo
#first dummy
#maxtsenergy dummy
#levels 26
#delta 0.5
#minima min.data
#ts ts.data
#monotonic
#order_by_energy
#lowest 2610
#scalebar 2
#EOF
#globalmin=$(sort -k 1n min.data | head -n 1 | awk '{print $1}')
#topvalue=$(echo "$globalmin + 12.0" | bc)
#sed -i "s/dummy/$topvalue/g" dinfo
#disconnectionDPS > di
#sed -i "s/1.5 setlinewidth/2.5 setlinewidth/g" tree.ps
#sed -i "s/(    1.00)/(    1.00 kcal\/mol)/g" tree.ps
#mv tree.ps "$1"tree.ps
cp identify"$1".ps "$1"tree.ps /sharedscratch/nn320/cv_analysis_on_allDB/disconngraphs/
