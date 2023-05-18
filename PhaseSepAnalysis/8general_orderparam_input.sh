#!/bin/bash

# The minima.mdcrd file is created using dump_mdcrd script in 
# softwarewales/SCRIPTS/AMBER/
# Its usage is 
# ./dump_mdcrd number_of_atoms
# Replace number_of_atoms with the integer value of number of atoms in 
# the peptide system

dir="/sharedscratch/nn320/cv_analysis_on_allDB"
dir1=$1
subdir="orderparam"
cp $dir/idp_order_parameter.py $dir/$1/$subdir
cp $dir/orderparamdef.py $dir/$1/$subdir
cd $dir/$1/$subdir
numberofatoms=$(head -n 2 coords.inpcrd | tail -n 1 | awk '{print $1}')

if [[ ! -f minima.mdcrd ]]
then
    dump_mdcrd $numberofatoms
fi

