#!/bin/bash
dir=/sharedscratch/nn320/cv_analysis_on_allDB
cd $dir/$1
rm -r energy_decomposition 2> /dev/null
mkdir energy_decomposition
cp coords.prmtop coords.inpcrd min.in energy_decomposition
cp min.A min.B min.data ts.data points.min points.ts energy_decomposition
cp odata.connect perm.allow energy_decomposition
cp "start" energy_decomposition
cd energy_decomposition
var=$(tail -n 1 $dir/$1/energy_decomposition/odata.connect | awk '{print $1}')
if [ $var == "AMBER20" ]
then
    cp $dir/pathdataA20_extractminfile $dir/$1/energy_decomposition/pathdata
elif [ $var == "AMBER12" ]
then
    cp $dir/pathdataA12_extractminfile $dir/$1/energy_decomposition/pathdata
else
    echo "There is something wrong in $1  directory"
fi
# cp $dir/pathdataA12_extractminfile ./pathdata
atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
sed -i "s/dof/$atoms/g" pathdata
nmin=$(wc -l min.data| awk '{print $1}')
seq $nmin > extractmin
/sharedscratch/nn320/softwarewales/PATHSAMPLE/builds/gfortran/PATHSAMPLE > output
if [ $var == "AMBER20" ]
then
    cp $dir/odataA20decompe $dir/$1/energy_decomposition/odata
    /sharedscratch/nn320/softwarewales/OPTIM/builds/gfortran_amber20/A20OPTIM > optim_output
elif [ $var == "AMBER12" ]
then
    cp $dir/odataA12decompe $dir/$1/energy_decomposition/odata
    /sharedscratch/nn320/softwarewales/OPTIM/builds/gfortran/A12OPTIM > optim_output
else
    echo "There is something wrong in $1  directory"
fi
#cp $dir/odataA12decompe ./odata
#/sharedscratch/nn320/softwarewales/OPTIM/builds/gfortran/A12OPTIM > optim_output

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

#paste -d ' ' bond_energy angular_energy > ba_dummy
#paste -d ' ' bond_energy angular_energy dihedral_energy vdw14_energy electronic14_energy > bad_dummy
paste -d ' ' bond_energy angular_energy dihedral_energy vdw14_energy electronic14_energy electronic_energy > bade_dummy
paste -d ' ' bond_energy angular_energy dihedral_energy vdw14_energy electronic14_energy vdw_energy > badv_dummy
#paste -d ' ' bond_energy angular_energy dihedral_energy vdw14_energy electronic14_energy electronic_energy gb_energy > badegb_dummy
#paste -d ' ' bond_energy angular_energy dihedral_energy vdw14_energy electronic14_energy vdw_energy gb_energy > badvgb_dummy
#paste -d ' ' bond_energy angular_energy dihedral_energy vdw14_energy electronic14_energy vdw_energy electronic_energy > badve_dummy
#paste -d ' ' bond_energy angular_energy dihedral_energy vdw14_energy electronic14_energy vdw_energy electronic_energy gb_energy > badvegb_dummy
#paste -d ' ' bond_energy angular_energy dihedral_energy vdw14_energy electronic14_energy vdw_energy electronic_energy gb_energy cmap_energy > badvegbcm_dummy


#awk '{print $1+$2}' ba_dummy > ba_energy
#awk '{print $1+$2+$3+$4+$5}' bad_dummy > bad_energy
awk '{print $1+$2+$3+$4+$5+$6}' bade_dummy > bade_energy
awk '{print $1+$2+$3+$4+$5+$6}' badv_dummy > badv_energy
#awk '{print $1+$2+$3+$4+$5+$6+$7}' badegb_dummy > badegb_energy
#awk '{print $1+$2+$3+$4+$5+$6+$7}' badvgb_dummy > badvgb_energy
#awk '{print $1+$2+$3+$4+$5+$6+$7}' badve_dummy > badve_energy
#awk '{print $1+$2+$3+$4+$5+$6+$7+$8}' badvegb_dummy > badvegb_energy
#awk '{print $1+$2+$3+$4+$5+$6+$7+$8+$9}' badvegbcm_dummy > badvegbcm_energy
# rm ba_dummy bad_dummy bade_dummy badv_dummy badve_dummy badvegb_dummy badvegbcm_dummy
rm bade_dummy badv_dummy #badvgb_dummy badegb_dummy
rm optim_output
rm min.data ts.data points.min points.ts
echo "energy decomposition done for $1"
cd $dir/
