#!/bin/bash

# input file requirement: you need fordijkstra in $dir/$1/

dir="/sharedscratch/nn320/cv_analysis_on_allDB"
dirname=$1
if [ -d "$dir/$1/dijkstra" ]
then
    echo "$dir/$1/dijkstra already exists"
else
    mkdir -p $dir/$1/dijkstra
fi
cp $dir/$1/* $dir/$1/dijkstra/
cd $dir/$1/dijkstra/
cat << EOF > pathdata_A12dummy_extract
NATOMS dof
EXTRACTMIN minnumber
TEMPERATURE 0.592
PLANCK 9.536D-14
EXEC /sharedscratch/nn320/softwarewales/OPTIM/builds/gfortran/A12OPTIM
COPYFILES perm.allow min.in coords.prmtop coords.inpcrd
COPYOPTIM
SEED 1
DIRECTION AB
CONNECTIONS 1
PERMDIST
ETOL 1.0D-4
GEOMDIFFTOL 3.0D-1
ITOL 1.0D0
AMBER12
EOF
atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
sed -i "s/dof/$atoms/g" pathdata_A12dummy_extract
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
for k in $(cat fordijkstra)
do
    cp pathdata_A12dummy_extract pathdata
    sed -i "s/minnumber/$k/g" pathdata
    /sharedscratch/nn320/softwarewales/PATHSAMPLE/builds/gfortran/PATHSAMPLE > output
    mv extractedmin.rst extractedmin"$k".rst
    cp script.pml dummyscript.pml                                           
    sed -i "s/dummy/$k/g" dummyscript.pml                                   
    mv dummyscript.pml script"$k".pml                                       
done
cp coords.prmtop coords.top
rm pathdata_A12dummy_extract
cat << EOF > pathdata_A12dummy_dijkstra
NATOMS dof
DIJKSTRA 0
TEMPERATURE 0.592
PLANCK 9.536D-14
EXEC /sharedscratch/nn320/softwarewales/OPTIM/builds/gfortran/A12OPTIM
COPYFILES perm.allow min.in coords.prmtop coords.inpcrd
COPYOPTIM
SEED 1
DIRECTION AB
CONNECTIONS 1
PERMDIST
ETOL 1.0D-4
GEOMDIFFTOL 3.0D-1
ITOL 1.0D0
AMBER12
EOF
atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
sed -i "s/dof/$atoms/g" pathdata_A12dummy_dijkstra
globalminno=$(awk '{print NR, $1}' min.data | sort -k 2n | head -n 1 | awk '{print $1}')
echo "1" > min.A
echo "$globalminno" >> min.A
cat << EOF > min.B
1
EOF
for k in $(cat fordijkstra)
do
    cp pathdata_A12dummy_dijkstra pathdata
    echo $k >> min.B
    if diff min.A min.B > /dev/null
    then
        echo "A and B are the same"
    else
        /sharedscratch/nn320/softwarewales/PATHSAMPLE/builds/gfortran/PATHSAMPLE > output
        mv stationary.points.xyz "$k"stationary.points.xyz
    fi
    sed -i '2d' min.B
done
rm pathdata_A12dummy_extract
rm pathdata_A12dummy_dijkstra
