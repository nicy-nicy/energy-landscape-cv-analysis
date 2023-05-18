#!/bin/bash
# Make sure there is disconn dir within full_cv directory 
# full_cv dir contains min.data ts.data points.min points.ts
# disconn dir contains peak1, peak11, peak2, peak22 files
dir="/sharedscratch/nn320/cv_analysis_on_allDB"
mkdir $dir/disconnCV
cd $dir/$1/full_cv/disconn
totalmin=$(wc -l ../min.data | awk '{print $1}')
groups=$(ls peak* | wc -l)
globalmin=$(sort -k 1n ../min.data | head -n 1 | awk '{print $1}')
topvalue=$(echo "$globalmin + 14.0" | bc)
cat << EOF > generaldinfo
first dummy
maxtsenergy dummy
levels 30
delta 0.5
minima ../min.data
ts ../ts.data
excludeall
pick pickfile
monotonic
order_by_energy
lowest 2610
scalebar 2
EOF
cat << EOF > generaldinfofull
autorange
delta 0.5
minima ../min.data
ts ../ts.data
excludeall
pick pickfile
monotonic
order_by_energy
EOF
cat << EOF > dinfo2
trmin 2 nmin p1 p11
EOF
cat << EOF > dinfo4
trmin 4 nmin p1 p11 p2 p22
EOF
cat << EOF > dinfo6
trmin 6 nmin p1 p11 p2 p22 p3 p33
EOF
cat << EOF > dinfo8
trmin 8 nmin p1 p11 p2 p22 p3 p33 p4 p44
EOF
# 2 groups: green purple
# 4 groups: yellow1 green lightblue2 purple
# 6 groups: red2, lightgreen1 green lightblue1 darkblue1 purple
# 8 groups: red1 yellow1 lightgreen2 green seagreen lightblue2 darkblue2 purple

red1="1 0.1250 0  setrgbcolor"
red2="1 0.3333 0  setrgbcolor"
yellow1="1 0.7500 0  setrgbcolor"

green="0.0000 1 0  setrgbcolor"
lightgreen1="0.8333 1 0  setrgbcolor"
lightgreen2="0.6250 1 0  setrgbcolor"
seagreen="0 1 0.6250  setrgbcolor"

lightblue1="0 1 0.8333  setrgbcolor"
lightblue2="0 0.7500 1  setrgbcolor"
darkblue1="0 0.3333 1  setrgbcolor"
darkblue2="0 0.1250 1  setrgbcolor"

purple="0.5000 0 1  setrgbcolor"

redME="1 0 0  setrgbcolor"
blueME="0 0 1  setrgbcolor"
greenME="0.26 1 0.26  setrgbcolor"
orangeME="1 0.5 0  setrgbcolor"
pinkME="1 0 1  setrgbcolor"
purpleME="0.6000 0 0.9  setrgbcolor"
cyanME="0.67 0.67 0.67  setrgbcolor"
yellowME="1 0.7500 0  setrgbcolor"

viridis1="0.27 0 0.33  setrgbcolor"
viridis2="0.26 0.27 0.53  setrgbcolor"
viridis3="0.17 0.47 0.56  setrgbcolor"
viridis4="0.13 0.66 0.52  setrgbcolor"
viridis5="0.48 0.82 0.32  setrgbcolor"
viridis6="0.99 0.91 0.15  setrgbcolor"
# red blue green orange pink purple grey yellow
if [[ $groups == "4" ]]
then 
    echo "block4"
    cat peak1 peak11 > 1peak
    cat peak2 peak22 > 2peak
    grep -vf 1peak peak2 > p2
    grep -vf 1peak peak22 > p22
    cp peak1 p1
    cp peak11 p11
    cat p1 p11 p2 p22 > pickfile
    rm 1peak 2peak
    cat generaldinfo dinfo$groups > dinfo
    sed -i "s/nmin/$totalmin/g" dinfo
    sed -i "s/dummy/$topvalue/g" dinfo
    disconnectionDPS
    sed -i "s/1.0 0.0 0.0/0.0 0.0 0.0/g" tree.ps
    sed -i "s/$yellow1/$redME/g" tree.ps
    sed -i "s/$green/$blueME/g" tree.ps
    sed -i "s/$lightblue2/$greenME/g" tree.ps
    sed -i "s/$purple/$orangeME/g" tree.ps
    sed -i "s/1.5 setlinewidth/2.6 setlinewidth/g" tree.ps
    sed -i "s/(    1.00)/(    )/g" tree.ps
    mv tree.ps $dir/disconnCV/"$1"cvtree.ps
    cat generaldinfofull dinfo$groups > dinfo
    sed -i "s/nmin/$totalmin/g" dinfo
    disconnectionDPS
    sed -i "s/$yellow1/$redME/g" tree.ps
    sed -i "s/$green/$blueME/g" tree.ps
    sed -i "s/$lightblue2/$greenME/g" tree.ps
    sed -i "s/$purple/$orangeME/g" tree.ps
    sed -i "s/1.5 setlinewidth/2.6 setlinewidth/g" tree.ps
    mv tree.ps $dir/disconnCV/"$1"full.ps
elif [[ $groups == "6" ]]
then 
    echo "block6"
    cat peak1 peak11 > 1peak
    cat peak2 peak22 > 2peak
    cat 1peak 2peak > 12peak
    grep -vf 1peak peak2 > p2
    grep -vf 1peak peak22 > p22
    grep -vf 12peak peak3 > p3
    grep -vf 12peak peak33 > p33
    cp peak1 p1
    cp peak11 p11
    cat p1 p11 p2 p22 p3 p33 > pickfile
    rm 1peak 2peak 12peak
    cat generaldinfo dinfo$groups > dinfo
    sed -i "s/nmin/$totalmin/g" dinfo
    sed -i "s/dummy/$topvalue/g" dinfo
    disconnectionDPS
    sed -i "s/1.0 0.0 0.0/0.0 0.0 0.0/g" tree.ps
    sed -i "s/$red2/$redME/g" tree.ps
    sed -i "s/$lightgreen1/$blueME/g" tree.ps
    sed -i "s/$green/$greenME/g" tree.ps
    sed -i "s/$lightblue1/$orangeME/g" tree.ps
    sed -i "s/$darkblue1/$pinkME/g" tree.ps
    sed -i "s/$purple/$purpleME/g" tree.ps
    sed -i "s/1.5 setlinewidth/2.6 setlinewidth/g" tree.ps
    sed -i "s/(    1.00)/(    )/g" tree.ps
    mv tree.ps $dir/disconnCV/"$1"cvtree.ps
    cat generaldinfofull dinfo$groups > dinfo
    sed -i "s/nmin/$totalmin/g" dinfo
    disconnectionDPS
    sed -i "s/$red2/$redME/g" tree.ps
    sed -i "s/$lightgreen1/$blueME/g" tree.ps
    sed -i "s/$green/$greenME/g" tree.ps
    sed -i "s/$lightblue1/$orangeME/g" tree.ps
    sed -i "s/$darkblue1/$pinkME/g" tree.ps
    sed -i "s/$purple/$purpleME/g" tree.ps
    sed -i "s/1.5 setlinewidth/2.6 setlinewidth/g" tree.ps
    mv tree.ps $dir/disconnCV/"$1"full.ps
elif [[ $groups == "2" ]]
then 
    echo "block2"
    cp peak1 p1
    cp peak11 p11
    cat p1 p11 > pickfile
    cat generaldinfo dinfo$groups > dinfo
    sed -i "s/nmin/$totalmin/g" dinfo
    sed -i "s/dummy/$topvalue/g" dinfo
    disconnectionDPS
    sed -i "s/1.0 0.0 0.0/0.0 0.0 0.0/g" tree.ps
    sed -i "s/$green/$redME/g" tree.ps
    sed -i "s/$purple/$blueME/g" tree.ps
    sed -i "s/1.5 setlinewidth/2.6 setlinewidth/g" tree.ps
    sed -i "s/(    1.00)/(    )/g" tree.ps
    mv tree.ps $dir/disconnCV/"$1"cvtree.ps
    cat generaldinfofull dinfo$groups > dinfo
    sed -i "s/nmin/$totalmin/g" dinfo
    disconnectionDPS
    sed -i "s/$green/$redME/g" tree.ps
    sed -i "s/$purple/$blueME/g" tree.ps
    sed -i "s/1.5 setlinewidth/2.6 setlinewidth/g" tree.ps
    mv tree.ps $dir/disconnCV/"$1"full.ps
elif [[ $groups == "8" ]]
then 
    echo "block8"
    cat peak1 peak11 > 1peak
    cat peak2 peak22 > 2peak
    cat peak3 peak33 > 3peak
    cat 1peak 2peak > 12peak
    cat 1peak 2peak 3peak > 123peak
    grep -vf 1peak peak2 > p2
    grep -vf 1peak peak22 > p22
    grep -vf 12peak peak3 > p3
    grep -vf 12peak peak33 > p33
    grep -vf 123peak peak4 > p4
    grep -vf 123peak peak44 > p44
    cp peak1 p1
    cp peak11 p11
    cat p1 p11 p2 p22 p3 p33 p4 p44 > pickfile
    rm 1peak 2peak 3peak 12peak 123peak
    cat generaldinfo dinfo$groups > dinfo
    sed -i "s/nmin/$totalmin/g" dinfo
    sed -i "s/dummy/$topvalue/g" dinfo
    disconnectionDPS
    sed -i "s/1.0 0.0 0.0/0.0 0.0 0.0/g" tree.ps
    sed -i "s/$red1/$redME/g" tree.ps
    sed -i "s/$yellow1/$blueME/g" tree.ps
    sed -i "s/$lightgreen2/$greenME/g" tree.ps
    sed -i "s/$green/$orangeME/g" tree.ps
    sed -i "s/$seagreen/$pinkME/g" tree.ps
    sed -i "s/$lightblue2/$purpleME/g" tree.ps
    sed -i "s/$darkblue2/$cyanME/g" tree.ps
    sed -i "s/$purple/$yellowME/g" tree.ps
    sed -i "s/1.5 setlinewidth/2.5 setlinewidth/g" tree.ps
    sed -i "s/(    1.00)/(    )/g" tree.ps
    mv tree.ps $dir/disconnCV/"$1"cvtree.ps
    cat generaldinfofull dinfo$groups > dinfo
    sed -i "s/nmin/$totalmin/g" dinfo
    disconnectionDPS
    sed -i "s/$red1/$redME/g" tree.ps
    sed -i "s/$yellow1/$blueME/g" tree.ps
    sed -i "s/$lightgreen2/$greenME/g" tree.ps
    sed -i "s/$green/$orangeME/g" tree.ps
    sed -i "s/$seagreen/$pinkME/g" tree.ps
    sed -i "s/$lightblue2/$purpleME/g" tree.ps
    sed -i "s/$darkblue2/$cyanME/g" tree.ps
    sed -i "s/$purple/$yellowME/g" tree.ps
    sed -i "s/1.5 setlinewidth/2.5 setlinewidth/g" tree.ps
    mv tree.ps $dir/disconnCV/"$1"full.ps
else
    echo "Something went wrong. Check"
fi
rm dinfo2 dinfo4 dinfo6 dinfo8 generaldinfo generaldinfofull
