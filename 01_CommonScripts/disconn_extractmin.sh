#!/bin/bash

# input file requirement: you need fordisconn in $dir/$1/

dir="/sharedscratch/nn320/cv_analysis_on_allDB"
dirname=$1
if [ -d "$dir/$1/extractdisconn" ]
then
    echo "$dir/$1/extractdisconn already exists"
else
    mkdir -p $dir/$1/extractdisconn
fi
cd $dir/$1/extractdisconn/
cp $dir/$1/* $dir/$1/extractdisconn/
rm pathdata
cp $dir/pathdata_A12dummy_extract .
atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
sed -i "s/dof/$atoms/g" pathdata_A12dummy_extract
if [[ $1 == *"nocap" ]] 
then
    cp $dir/nocapdisconn.pml script.pml
else
    cp $dir/capdisconn.pml script.pml
fi
for k in $(cat fordisconn)
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
cd $dir/
