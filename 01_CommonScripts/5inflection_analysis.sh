#!/bin/bash

# Change dir variable to specify path to your cv_analysis_on_allDB directory
# Ensure you have CVHSA executable in your bin
dirname=$1
dir="/sharedscratch/nn320/cv_analysis_on_allDB"
# manually modify inflectionpoints file in $2 directory
# Reason1: you already have a copy of inflectionpoints as allinflectionpoints
# Reason2: you do not want to analyse irrelevant inflectionpoints caught by script
# Reason3: save time and run it only for temperatures of interest found 
# by manually looking at the overall Cv versus temperature plot.

cd $dir/$1/$2/
var=$(tail -n 1 $dir/$1/$2/odata.connect | awk '{print $1}')
atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
nmin=$(wc -l min.data| awk '{print $1}')

inflno=$(wc -l inflectionpoints | awk '{print $1}')
mkdir -p $(seq --format 'infl%.0f' 1 $inflno)
echo infl[0-9] | xargs -n 1 cp coords.prmtop coords.inpcrd min.in
echo infl[0-9] | xargs -n 1 cp perm.allow "start" min.A min.B
echo infl[0-9] | xargs -n 1 cp Cv.data Cv.out
echo infl[0-9] | xargs -n 1 cp min.data ts.data
echo infl[0-9] | xargs -n 1 cp points.min points.ts
echo infl[0-9] | xargs -n 1 cp odata.connect pathdata
echo infl[0-9] | xargs -n 1 cp inflectionpoints
for i in `seq 1 $inflno`;
do
    cd infl$i
    head -n $i inflectionpoints | tail -n 1 > temp
    awk '{print $1}' temp > Tanal00
    cat Tanal00 | tr -cd '[:alnum:]._-' > Tanal0
    if [ ! -s Tanal0 ]
    then
        awk '{print $2}' temp > Tanal00
        cat Tanal00 | tr -cd '[:alnum:]._-' > Tanal0
    fi
    cat Tanal0 | awk -F"E" 'BEGIN{OFMT="%1.4f"} {print $1 * (10 ^ $2)}' > Tanal1
    cat Tanal1 $dir/Tanal2 > Tanal
    PATHSAMPLE > output_PATHSAMPLE
    CVHSA > output_infl
    t=$(cat Tanal1)
    maxtemp=$(echo "$t + 0.2" | bc)
    # mintemp=$(echo "$t - 0.2" | bc)
    # if [ $mintemp <= 0.01 ]
    # then
    #     $mintemp="0.01"
    # fi
    sed -i "s/1.2/$maxtemp/g" pathdata
    PATHSAMPLE > output_PATHSAMPLE
    mv Cv.out Cvinfl.out
    rm Tanal1 Tanal0 temp Tanal00
    head -n 1 min.minus > extractminstr
    head -n 1 min.plus >> extractminstr
    head -n 1 min.minus > firstmin
    head -n 1 min.plus > secondmin
    paste -d "," firstmin secondmin > transitionmininfl$i
    cp transitionmininfl$i ../
    echo "TRMIN 2 $nmin min.minus min.plus" >> dinfo
    echo "CHOOSECOLOURS" >> dinfo
    if [ $2 == "full_cv" ]
    then
        cp min.minus ../disconn/pick"$i"
        cp min.plus ../disconn/pick"$i""$i"
    fi
    #disconnectionDPS
    #dump_mdcrd $atoms
    mkdir extractmin
    cp coords.prmtop coords.inpcrd min.in extractmin/
    cp min.A min.B "start" perm.allow extractmin/
    cp odata.connect extractmin/
    cp points.min points.ts extractmin/
    cp extractminstr extractmin/
    if [ $1 == *"99idps_cap" ] || [ $1 == *"99idps_nocap" ]
    then
        cp $dir/pathdata_A12dummy_extract extractmin/
        cd extractmin
        sed -i "s/dof/$atoms/g" pathdata_A12dummy_extract
        for k in $(cat extractminstr)
        do
            cp pathdata_A12dummy_extract pathdata
            sed -i "s/minnumber/$k/g" pathdata
            PATHSAMPLE > output
            mv extractedmin.rst extractedmin"$k".rst
        done
        mv extractedmin*rst ../
        cat extractminstr >> ../../../extractminstr
        cd ../
    else
        cp $dir/pathdata_A20dummy_extract extractmin/
        cd extractmin
        sed -i "s/dof/$atoms/g" pathdata_A20dummy_extract
        for k in $(cat extractminstr)
        do
            cp pathdata_A20dummy_extract pathdata
            sed -i "s/minnumber/$k/g" pathdata
            PATHSAMPLE > output
            mv extractedmin.rst extractedmin"$k".rst
        done
        mv extractedmin*rst ../
        cat extractminstr >> ../../../extractminstr
        cd ../
    fi
    rm -r extractmin

    if [[ $1 == *"nocap" ]] 
    then
        cp $dir/nocap.pml script.pml
    else
        cp $dir/cap.pml script.pml
    fi
    if [[ $1 == dimer*"cap" ]] 
    then
        cp $dir/dimercap.pml script.pml
    fi
    for l in $(cat extractminstr)                                        
    do                                                                              
        cp script.pml dummyscript.pml                                           
        sed -i "s/dummy/$l/g" dummyscript.pml                                   
        mv dummyscript.pml script"$l".pml                                       
        #convert -trim min"$l".png m"$l".png
    done                                     
    cp script*.pml ../
    cp extractedmin*rst ../
    cd ../
done
# cat peptide transition* >> $dir/transitionmin
echo "inflection point $2 analysis done for $1"
cd $dir/
