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
dumpnumbers
EOF
globalmin=$(sort -k 1n min.data | head -n 1 | awk '{print $1}')
topvalue=$(echo "$globalmin + 12.0" | bc)
idmintop=$(echo "$globalmin + 4.0" | bc)
sed -i "s/dummy/$topvalue/g" dinfo
disconnectionDPS > di
sed -i "/LEVEL/d" node_numbers
sed -i "/Node/d" node_numbers
sed -i "/=/d" node_numbers
sed -i "/^$/d" node_numbers
sort node_numbers | uniq > idfile
rm node_numbers
rm -f ids
for i in $(cat idfile)
do
    energy=$(sed -n "$i"p min.data | awk '{print $1}')
    if (( $(echo "$energy <= $idmintop" | bc -l) ))
    then
        echo "$i $energy" >> ids
    fi
done
rm idfile
sort -k 2n ids | head -n 26 | awk '{print $1}' > idonT
sort -k 2n ids | head -n 100 | awk '{print $1}' > bottom100
# cp idonT ../../fordijkstra
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
idminfile idonT
scalebar 2
EOF
sed -i "s/dummy/$topvalue/g" dinfo
disconnectionDPS > di
sed -i "s/(    1.00)/(    $1)/g" tree.ps
mv tree.ps id4"$1".ps
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
idminfile bottom100
scalebar 2
EOF
sed -i "s/dummy/$topvalue/g" dinfo
disconnectionDPS > di
mv tree.ps identify"$1".ps
sed -i "s/(    1.00)/(    $1)/g" tree.ps
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
scalebar 2
EOF
sed -i "s/dummy/$topvalue/g" dinfo
disconnectionDPS > di
sed -i "s/1.5 setlinewidth/2.5 setlinewidth/g" tree.ps
sed -i "s/(    1.00)/(    1.00 kcal\/mol)/g" tree.ps
mv tree.ps "$1"tree.ps
cp id4"$1".ps  /sharedscratch/nn320/cv_analysis_on_allDB/disconngraphs/
cp identify"$1".ps "$1"tree.ps /sharedscratch/nn320/cv_analysis_on_allDB/disconngraphs/
