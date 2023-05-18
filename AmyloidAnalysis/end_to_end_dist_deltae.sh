#!/bin/bash
dir="/sharedscratch/nn320/cv_analysis_on_allDB"
dirname=$1
cppdir="/sharedscratch/nn320/softwarewales/cpptraj-master/bin"
mkdir $dir/end_to_end_distances
cd $dir/$1/
mkdir cpptraj_output
cp coords.prmtop coords.inpcrd fordisconn min.data points.min cpptraj_output
cd cpptraj_output
atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
cp coords.prmtop ambercoords.prmtop
sed -i 2d ambercoords.prmtop
sed -i 2d ambercoords.prmtop
sed -i 2d ambercoords.prmtop
sed -i 2d ambercoords.prmtop
sed -i 2d ambercoords.prmtop
dump_mdcrd $atoms
cat << EOF > incalcdist
trajin minima.mdcrd                                                            
distance e2e :2@N :7@C out end_to_end_dist.out 
EOF
$cppdir/cpptraj -i incalcdist -p ambercoords.prmtop
cp end_to_end_dist.out myfile                                                  
sed -i 1d myfile
globalmin=$(sort -k 1n min.data | head -n 1 | awk '{print $1}')                
rm file1 file2
for i in $(cat fordisconn)                                                     
do                                                                             
    sed -n "$i"p myfile >> file1                                                        
    mymine=$(head -n $i min.data | tail -n 1 | awk '{print $1}')               
    echo "$globalmin - $mymine" | bc >> file2                                  
done 
paste -d "\t" file1 file2 > "$1"endtoend.dat
echo "$1" >> "$1"endtoend.dat
cp "$1"endtoend.dat $dir/end_to_end_distances/
cd $dir
