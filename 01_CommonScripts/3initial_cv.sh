#!/bin/bash

# Change the value of dir variable to specify path to your
# cv_analysis_on_allDB folder subfolder
# subfolder can take values: full_cv, bade, badv

# output files have the following information
# cvtable has temperature and Cv value of the peak point
# transitionmin file has a pair of minima for each peak for each peptide
# cvbasepoints has Cv and temp for lowest Cv for each peptide
# peptidedir3col.txt in pythondata folder has file for each peptide containing
# peak: temp, cv, relative value from baseline (taken as the lowest Cv value)

dir="/sharedscratch/nn320/cv_analysis_on_allDB"
dir1=$1
subdir=$2

# Running Cv analysis in $2 directory
if [ -d "$dir/$1/fullcv" ]
then
    rm -r $dir/$1/fullcv
fi

mkdir -p $dir/$1/$2

# Obtaining desired input files for running Cv calculation
cp $dir/$1/coords.prmtop $dir/$1/$2/
cp $dir/$1/coords.inpcrd $dir/$1/$2/
cp $dir/$1/min.in $dir/$1/$2/
cp $dir/$1/min.data $dir/$1/$2/
cp $dir/$1/ts.data $dir/$1/$2/
cp $dir/$1/points.min $dir/$1/$2/
cp $dir/$1/points.ts $dir/$1/$2/
cp $dir/$1/"start" $dir/$1/$2/
cp $dir/$1/min.A $dir/$1/$2/
cp $dir/$1/min.B $dir/$1/$2/
cp $dir/$1/odata.connect $dir/$1/$2/
cp $dir/$1/perm.allow $dir/$1/$2/

var=$(tail -n 1 $dir/$1/$2/odata.connect | awk '{print $1}')

if [ $var == "AMBER20" ]
then
    cp pathdata_A20dummy $dir/$1/$2/pathdata
elif [ $var == "AMBER12" ]
then
    cp pathdata_A12dummy $dir/$1/$2/pathdata
else
    echo "There is something wrong in $1 and $2 directory"
fi

cd $dir/$1/$2/
atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
kappa=$(echo "$atoms*3 - 6" | bc)
nmin=$(wc -l min.data| awk '{print $1}')
sed -i "s/dof/$atoms/g" pathdata

if [ $2 == "full_cv" ]
then
    mkdir -p $dir/$1/$2/disconn
    cp min.data ts.data points.min points.ts disconn/
elif [ $2 == "bade" ]
then
    cp $dir/$1/energy_decomposition/"$2"_energy .
    awk '{print $2, $3, $4, $5, $6}' min.data > new_min.data1
    rm min.data
    paste -d ' ' "$2"_energy new_min.data1 > min.data
    rm new_min.data1
elif [ $2 == "badv" ]
then
    cp $dir/$1/energy_decomposition/"$2"_energy .
    awk '{print $2, $3, $4, $5, $6}' min.data > new_min.data1
    rm min.data
    paste -d ' ' "$2"_energy new_min.data1 > min.data
    rm new_min.data1
elif [ $2 == "badegb" ]
then
    cp $dir/$1/energy_decomposition/"$2"_energy .
    awk '{print $2, $3, $4, $5, $6}' min.data > new_min.data1
    rm min.data
    paste -d ' ' "$2"_energy new_min.data1 > min.data
    rm new_min.data1
elif [ $2 == "badvgb" ]
then
    cp $dir/$1/energy_decomposition/"$2"_energy .
    awk '{print $2, $3, $4, $5, $6}' min.data > new_min.data1
    rm min.data
    paste -d ' ' "$2"_energy new_min.data1 > min.data
    rm new_min.data1
fi

/sharedscratch/nn320/softwarewales/PATHSAMPLE/builds/gfortran/PATHSAMPLE > output_cv

# After running Cv calculation, move the output to pythondata folder
# in desired format for use in plotting.
awk '{print $1}' Cv.out > col1
awk '{print $2}' Cv.out > col2
mkdir -p $dir/pythondata
if [ $2 == "full_cv" ]
then
    paste -d "," col1 col2 > "$1"_cv.dat
    cp "$1"_cv.dat $dir/pythondata
elif [ $2 == "bade" ]
then
    paste -d "," col1 col2 > "$1"_cv.dat
    paste -d ',' col1 col2 > $dir/pythondata/"$1"_"$2".dat
elif [ $2 == "badv" ]
then
    paste -d "," col1 col2 > "$1"_cv.dat
    paste -d ',' col1 col2 > $dir/pythondata/"$1"_"$2".dat
elif [ $2 == "badegb" ]
then
    paste -d "," col1 col2 > "$1"_cv.dat
    paste -d ',' col1 col2 > $dir/pythondata/"$1"_"$2".dat
elif [ $2 == "badvgb" ]
then
    paste -d "," col1 col2 > "$1"_cv.dat
    paste -d ',' col1 col2 > $dir/pythondata/"$1"_"$2".dat
fi
rm col1 col2

# Cv.data file is input file for running CVHSA executable
cp $dir/Cv.data $dir/$1/$2/
datapointscv=$(wc -l Cv.out | awk '{print $1}')
sed -i "s/dof/$kappa/g" Cv.data
sed -i "s/numberofminima/$nmin/g" Cv.data
sed -i "s/dp/$datapointscv/g" Cv.data

# Running some python scripts to obtain peak points and inflection points
# in Cv versus temperature plots
cp $dir/cvanalysis.py $dir/$1/$2/
cp $dir/inflection.py $dir/$1/$2/
cp $dir/mincv.py $dir/$1/$2/
cp $dir/relative_cv.py $dir/$1/$2/

sed -i "s/myfile/$1/g" cvanalysis.py
sed -i "s/myfile/$1/g" inflection.py
sed -i "s/myfile/$1/g" mincv.py

echo "$1" > peptide
python cvanalysis.py > infopeak
cat peptide infopeak >> $dir/"$2"table
python inflection.py > inflectionpoints
cp inflectionpoints allinflectionpoints
cp infopeak modified_infopeak
sed -i 's/[][]//g' modified_infopeak
#python mincv.py > basepoint
#cat peptide basepoint >> $dir/"$2"basepoints
#python relative_cv.py 
# mv 3col.txt "$1""$2"3col.txt
# cp "$1""$2"3col.txt $dir/pythondata/

cp coords.prmtop coords.top
echo "Cv analysis for $2 done for $1 "
cd $dir/
