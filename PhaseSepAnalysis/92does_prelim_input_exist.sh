#!/bin/bash

# The old_mol.pdb file was the pdb file created when you created 
# coords.prmtop file using tleap in AMBER

dir="/sharedscratch/nn320/cv_analysis_on_allDB"
dir1=$1
subdir="orderparam"
cd $dir/$1/$subdir
if [[ ! -f coords.inpcrd ]]
then
    echo "coords.inpcrd does not exist"
else
    echo "coords.inpcrd does exist"
fi
if [[ ! -f min.data ]]
then
    echo "min.data does not exist"
else
    totalminima=$(wc -l min.data | awk '{print $1}')
    echo "min.data exists and it has number of minima = $totalminima"
fi
if [[ ! -f points.min ]]
then
    echo "points.min does not exist"
else
    echo "points.min does exist"
fi
if [[ ! -f old_mol.pdb ]]
then
    echo "old_mol.pdb does not exist"
else
    echo "old_mol.pdb does exist"
fi
if [[ ! -f ~/bin/dump_mdcrd ]]
then
    echo "dump_mdcrd does not exist in ~/bin"
else
    echo "dump_mdcrd does exist in ~/bin"
fi
if [[ ! -f minnoIMP ]]
then
    echo "minnoIMP does not exist"
else
    echo "minnoIMP does exist"
fi
if [[ ! -f minnoenergyIMP ]]
then
    echo "minnoenergyIMP does not exist"
else
    echo "minnoenergyIMP does exist"
fi
if [[ ! -f minenergyIMP ]]
then
    echo "minenergyIMP does not exist"
else
    echo "minenergyIMP does exist"
fi
if [[ ! -f peptidename ]]
then
    echo "peptidename does not exist"
else
    echo "peptidename does exist"
fi
if [[ ! -f input_order_parameter ]]
then
    echo "input_order_parameter does not exist"
else
    echo "input_order_parameter does exist"
fi
python idp_order_parameter.py
echo "orderparam analysis done for $1"
