#!/bin/bash

dir="/sharedscratch/nn320/cv_analysis_on_allDB"
subdir=$1
mkdir -p $dir/checkmin_output/
mkdir -p $dir/$1/checkmin
cp $dir/$1/* $dir/$1/checkmin/
cd $dir/$1/checkmin
rm pathdata
cat << EOF > pathdata
NATOMS dof
CHECKMIN 1 totalminima
CYCLES totalminima
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
cp odata.connect odata.checksp
rm odata.connect
sed -i "s/BFGSSTEPS 20000/BFGSSTEPS 1/g" odata.checksp
# You will also need to delete all DNEB lines from odata.checksp
atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
sed -i "s/dof/$atoms/g" pathdata
nmin=$(wc -l min.data| awk '{print $1}')
sed -i "s/totalminima/$nmin/g" pathdata
#/sharedscratch/nn320/softwarewales/PATHSAMPLE/builds/gfortran/PATHSAMPLE > output_checkmin
#cp output_checkmin $dir/checkmin_output/"$1"output_checkmin
cd $dir
