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

awk -v pep=$1 '$1==pep {print $2}' temps_for_pca.dat > $dir/$1/pcapeak
# Running Cv analysis in $2 directory
if [ -d "$dir/$1/$2" ]
then
    rm -r $dir/$1/$2
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

if [ $2 == "pca" ]
then
    FILE="pcapeak"
    denom=$(echo "3*$atoms - 6" | bc)
    if [ -f "$dir/$1/$FILE" ]; then
        cp $dir/$1/$FILE $dir/$1/$2/
        /sharedscratch/nn320/softwarewales/PATHSAMPLE/builds/gfortran/PATHSAMPLE > output_cv
        mypeak=$(head -n 1 $FILE)
        awk -v mvar=$mypeak '$1==mvar {print $1}' Cv.out > f1
        awk -v mvar=$mypeak -v dr=$denom '$1==mvar {print $2/dr}' Cv.out > f2
        paste -d ',' pcapeak f2 > "$1"PositionHeight
        rm f1 f2
    else
        exit
    fi
fi

# Cv.data file is input file for running CVHSA executable
cp $dir/Cv.data $dir/$1/$2/
datapointscv=$(wc -l Cv.out | awk '{print $1}')
sed -i "s/dof/$kappa/g" Cv.data
sed -i "s/numberofminima/$nmin/g" Cv.data
sed -i "s/dp/$datapointscv/g" Cv.data

echo "Cv analysis for $2 done for $1 "

head -n 1 pcapeak | tail -n 1 pcapeak > Tanal1
cat Tanal1 $dir/Tanal2 > Tanal
rm Tanal1
CVHSA > output_peak
head -n 1 min.minus > firstmin
head -n 1 min.plus > secondmin
cat firstmin secondmin > extractmin

echo "CVHSA analysis done for $2 done for $1 "

if [ $var == "AMBER20" ]
then
    cp $dir/pathdataA20_extractminfile $dir/$1/$2/pathdata
elif [ $var == "AMBER12" ]
then
    cp $dir/pathdataA12_extractminfile $dir/$1/$2/pathdata
else
    echo "There is something wrong in $1, $2  directory"
fi
sed -i "s/dof/$atoms/g" pathdata
/sharedscratch/nn320/softwarewales/PATHSAMPLE/builds/gfortran/PATHSAMPLE > output
if [ $var == "AMBER20" ]
then
    cp $dir/odataA20decompe $dir/$1/$2/odata
    /sharedscratch/nn320/softwarewales/OPTIM/builds/gfortran_amber20/A20OPTIM > optim_output
elif [ $var == "AMBER12" ]
then
    cp $dir/odataA12decompe $dir/$1/$2/odata
    /sharedscratch/nn320/softwarewales/OPTIM/builds/gfortran/A12OPTIM > optim_output
else
    echo "There is something wrong in $1, $2  directory"
fi

grep "Total energy:" optim_output | awk '{print $3}'  > total_energy
grep "Total van der Waals:" optim_output | awk '{print $5}'  > vdw_energy
grep "Total electronic:" optim_output | awk '{print $3}'  > electronic_energy
grep "Generalised Born:" optim_output | awk '{print $3}'  > gb_energy
grep "Bond energy:" optim_output | awk '{print $3}'  > bond_energy
grep "Angular term:" optim_output | awk '{print $3}'  > angular_energy
grep "Dihedral term:" optim_output | awk '{print $3}'  > dihedral_energy
grep "vdW 1-4 term:" optim_output | awk '{print $4}'  > vdw14_energy
grep "Electronic 1-4:" optim_output | awk '{print $3}'  > electronic14_energy
grep "CMAP:" optim_output | awk '{print $2}'  > cmap_energy

sed -i 1d total_energy
sed -i 1d vdw_energy
sed -i 1d electronic_energy
sed -i 1d gb_energy
sed -i 1d bond_energy
sed -i 1d angular_energy
sed -i 1d dihedral_energy
sed -i 1d vdw14_energy
sed -i 1d electronic14_energy
sed -i 1d cmap_energy

echo $1 > myfile
mkdir $dir/mypcapeak1
paste -d "," myfile "$1"PositionHeight > "$1"pca.dat
for i in total vdw electronic gb bond angular dihedral vdw14 electronic14 cmap
do
    cp "$1"pca.dat dummy
    t1=$(head -n 1 "$i"_energy)
    t2=$(tail -n 1 "$i"_energy)
    subtract=$(echo "$t2 - $t1" | bc)
    echo $subtract > difference
    echo $subtract >> "$i"_energy
    paste -d "," dummy difference > "$1"pca.dat
done
cp "$1"pca.dat $dir/mypcapeak1/
rm output_peak min.data ts.data points.min points.ts
echo "$1 $2 done"
cd $dir/
