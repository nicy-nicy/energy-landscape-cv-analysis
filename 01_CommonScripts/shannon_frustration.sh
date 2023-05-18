#!/bin/bash

# input file requirement:  $dir/$1/

dir="/sharedscratch/nn320/cv_analysis_on_allDB"
dirname=$1
if [ -d "$dir/$1/shannon" ]
then
    echo "$dir/$1/shannon already exists"
else
    mkdir -p $dir/$1/shannon
fi
cp $dir/$1/* $dir/$1/shannon/
cd $dir/$1/shannon/

globalmin=$(sort -k 1n min.data | head -n 1 | awk '{print $1}')
highestts=$(echo "$globalmin + 26.0" | bc)
awk -v maxts=$highestts '$1 > maxts {print NR}' ts.data > ts.remove1
wc -l ts.remove1 | awk '{print $1}' > ts.remove0
cat ts.remove0 ts.remove1 > ts.remove
rm ts.remove0 ts.remove1
cat << EOF > min.remove
0
EOF

var=$(tail -n 1 $dir/$1/shannon/odata.connect | awk '{print $1}')
if [ $var == "AMBER20" ]
then
    cp $dir/pathdata_A20dummy_removesp $dir/$1/shannon/pathdata
elif [ $var == "AMBER12" ]
then
    cp $dir/pathdata_A12dummy_removesp $dir/$1/shannon/pathdata
else
    echo "There is something wrong in $1 and shannon during removesp directory"
fi
atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
sed -i "s/dof/$atoms/g" pathdata
/sharedscratch/nn320/softwarewales/PATHSAMPLE/builds/gfortran/PATHSAMPLE > output_removesp
mv min.data.removed min.data
mv ts.data.removed ts.data
mv points.min.removed points.min
mv points.ts.removed points.ts
rm min.remove ts.remove pathdata min.A.removed min.B.removed
cat << EOF > pathdata_A12dummy_shannon
NATOMS dof
SHANNON 0.01 1.2 0.01 0.5 -1
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
cat << EOF > pathdata_A20dummy_shannon
NATOMS dof
SHANNON 0.01 1.2 0.01 0.5 -1
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
var=$(tail -n 1 $dir/$1/odata.connect | awk '{print $1}')
atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
if [ $var == "AMBER20" ]                                                       
then                                                                           
    rm pathdata_A12dummy_shannon
    sed -i "s/dof/$atoms/g" pathdata_A20dummy_shannon
    cp pathdata_A20dummy_shannon pathdata
elif [ $var == "AMBER12" ]                                                     
then                                                                           
    rm pathdata_A20dummy_shannon
    sed -i "s/dof/$atoms/g" pathdata_A12dummy_shannon
    cp pathdata_A12dummy_shannon pathdata
else                                                                           
    echo "There is something wrong in $1 directory"                     
fi                                                              
/sharedscratch/nn320/softwarewales/PATHSAMPLE/builds/gfortran/PATHSAMPLE > output
awk '{print $1}' Shannon.out > col1
awk '{print $4}' Shannon.out > col4
mkdir -p $dir/frustrationindex
paste -d "," col1 col4 > $dir/frustrationindex/"$1"_frustrationindex.dat
