#!/bin/bash

# input file requirement

# before you run this script, you need to ensure
# the directories have extractminstr file
# the above file contains list of minima numbers
# the structure of which we want to obtain

# output files produced are
# pdb, rst and extractedmin_energy file

dir="/sharedscratch/nn320/cv_analysis_on_allDB"
dirname=$1
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
cat << EOF > pathdata_A20dummy_extract
NATOMS dof
EXTRACTMIN minnumber
TEMPERATURE 0.592
PLANCK 9.536D-14
EXEC /sharedscratch/nn320/softwarewales/OPTIM/builds/gfortran_amber20/A20OPTIM
COPYFILES perm.allow min.in coords.prmtop coords.inpcrd
COPYOPTIM
SEED 1
DIRECTION AB
CONNECTIONS 1
PERMDIST
ETOL 1.0D-4
GEOMDIFFTOL 3.0D-1
ITOL 1.0D0
AMBER20
EOF
if [ -d "$dir/$1/extractmin" ]
then
    echo "$dir/$1/extractmin already exists"
else
    mkdir -p $dir/$1/extractmin
fi
cp $dir/$1/* $dir/$1/extractmin/
cd $dir/$1/extractmin/
atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
cp $dir/pathdata_A12dummy_extract .
cp $dir/pathdata_A20dummy_extract .
sed -i "s/dof/$atoms/g" pathdata_A12dummy_extract
sed -i "s/dof/$atoms/g" pathdata_A20dummy_extract
var=$(tail -n 1 $dir/$1/odata.connect | awk '{print $1}')
for k in $(cat extractminstr)
do
    if [ $var == "AMBER20" ]
    then
        cp pathdata_A20dummy_extract pathdata
    elif [ $var == "AMBER12" ]
    then
        cp pathdata_A12dummy_extract pathdata
    else
        echo "There is something wrong in $1  directory"
    fi
    sed -i "s/minnumber/$k/g" pathdata
    PATHSAMPLE > output
    # ambpdb -p coords.prmtop -c extractedmin.rst > min"$k".pdb
    mv extractedmin.rst extractedmin"$k".rst
    awk -v var=$k 'NR==var {print NR, $1}' min.data >> extractedmin_energy
    awk -v var=$k 'NR==var {print $1}' min.data >> only_energy
done
mkdir -p ../orderparam
sort -k 1n extractminstr | uniq > ../orderparam/minnoIMP
sort -k 1n extractedmin_energy | uniq > ../orderparam/minnoenergyIMP
sort -k 1n only_energy | uniq > ../orderparam/minenergyIMP
cp extractedmin*rst ../orderparam/
cp $dir/$1/coords.prmtop $dir/$1/orderparam
cp $dir/$1/coords.inpcrd $dir/$1/orderparam
cp $dir/$1/min.data $dir/$1/orderparam
cp $dir/$1/points.min $dir/$1/orderparam
cp $dir/$1/old_mol.pdb $dir/$1/orderparam
cd $dir/
#rm pathdata_A12dummy_extract
#rm pathdata_A20dummy_extract
