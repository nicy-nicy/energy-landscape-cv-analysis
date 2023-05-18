#!/bin/bash
# Usage ./script folder subfolder
# Change dir variable to specify path to your cv_analysis_on_allDB directory
# Ensure you have CVHSA executable in your bin
# The code for CVHSA is in softwarewales/UTILS/GMIN/Cv.HSA.f90
# compile code using: gfortran Cv.HSA.f90 -o CVHSA
# Put it in bin using: cp CVHSA ~/bin
dir="/sharedscratch/nn320/cv_analysis_on_allDB"
dirname=$1
subdir=$2


cd $dir/$1/$2/
var=$(tail -n 1 $dir/$1/$2/odata.connect | awk '{print $1}')
atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
nmin=$(wc -l min.data| awk '{print $1}')

peakno=$(wc -l infopeak | awk '{print $1}')

# Doing individual Cv analysis at every peak
mkdir -p $(seq --format 'peak%.0f' 1 $peakno)
echo peak* | xargs -n 1 cp coords.prmtop coords.inpcrd min.in
echo peak* | xargs -n 1 cp perm.allow "start" min.A min.B
echo peak* | xargs -n 1 cp Cv.data Cv.out
echo peak* | xargs -n 1 cp min.data ts.data
echo peak* | xargs -n 1 cp points.min points.ts
echo peak* | xargs -n 1 cp odata.connect pathdata
echo peak* | xargs -n 1 cp infopeak 
for i in `seq 1 $peakno`;
do
    cd peak$i
    head -n $i infopeak | tail -n 1 > temp
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
    CVHSA > output_peak
    t=$(cat Tanal1)
    maxtemp=$(echo "$t + 0.2" | bc)
    # mintemp=$(echo "$t - 0.2" | bc)
    # if [ $mintemp <= 0.01 ]
    # then
    #     $mintemp="0.01"
    # fi
    sed -i "s/1.2/$maxtemp/g" pathdata
    PATHSAMPLE > output_PATHSAMPLE
    mv Cv.out Cvpeak.out
    rm Tanal1 Tanal0 temp Tanal00
    head -n 1 min.minus > extractminstr
    head -n 1 min.plus >> extractminstr
    head -n 1 min.minus > firstmin
    head -n 1 min.plus > secondmin
    paste -d "," firstmin secondmin > transitionminpeak$i
    mv transitionminpeak$i ../
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
        cat extractminstr >> ../../extractminstr
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
#cat peptide transition* >> $dir/transitionmin
echo "peak analysis done for $1 and $2"
cd $dir/
