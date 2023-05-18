#!/bin/bash

# Make changes to this script to specify the correct path for OPTIM executable
# The AMBER OPTIM executable is called A12OPTIM given as argument of EXEC
# in the pathdata file. For example,
# EXEC /sharedscratch/username/softwarewales/OPTIM/builds/gfortran/A12OPTIM

cat << EOF > Cv.data
0.01 1.2 dp dof numberofminima
EOF
cat << EOF > Tanal2
0.98
EOF
cat << EOF > pathdata_A12dummy
NATOMS dof
CV 0.01 1.2 0.001
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
cat << EOF > pathdata_A12dummy_removesp
NATOMS dof
REMOVESP
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
# myfile variable takes the value of directory name (corresponding to peptide)
# supplied to script 3cv_ana_run_pathsample.sh
cat << EOF > cvanalysis.py                                                      
#!/usr/bin/env python                                                           
import numpy as np                                                              
from scipy.signal import find_peaks                                             
from os.path import exists                                                      
def peakpoints(csvfile):                                                        
    pep = np.genfromtxt(csvfile, delimiter = ",")                               
    seq = pep[:,1]                                                              
    indices = find_peaks(seq)[0]                                                
    return pep[indices], pep[0,1]                                               
varfile = "myfile"+'_cv.dat'                                             
if exists(varfile):                                                         
     peak_t_cv=peakpoints(varfile)[0]                                        
     result = peak_t_cv                                                      
     first_cv = peakpoints(varfile)[1]                                       
     print(result)                                         
EOF
chmod u+x cvanalysis.py
# The output of cvanalysis.py is printed to infopeak which is then modified to
# modified_infopeak which contains the temperature and Cv values at which peak
# occurs. Every row contains information about one peak.
# infopeak along with peptide name is also concatenated to cvtable file
cat << EOF > inflection.py                                                      
#!/usr/bin/env python                                                           
import numpy as np                                                              
from os.path import exists                                                      
varfile = "myfile"+'_cv.dat'                                             
if exists(varfile):                                                         
    data = np.genfromtxt(varfile,delimiter=',')                                    
    data2 = np.gradient(np.gradient(data[:,1],1))                                  
    infls = np.where(np.diff(np.sign(data2)))[0]                                   
    data3 = data[:,0][infls]                                                       
    data4 = list(np.round(data3,4))                                                
    for i in data4:
        print(i)
EOF
chmod u+x inflection.py 
# The output of inflection.py is in inflectionpoints
# You do not need to analyse Cv at all the inflectionpoints
# Choose the inflectionpoint of interest manually by visualising
# Cv vs temperature plot.
cat << EOF > mincv.py
#!/usr/bin/env python                                                           
import numpy as np
from os.path import exists                                                      
def mincvt(csvfile):
    pep = np.genfromtxt(csvfile, delimiter = ",")
    mincv = np.nanmin(pep[:,1])
    mintemp = pep[np.argmin(pep[:,1]),0]
    print(mincv, mintemp)
varfile = "myfile"+'_cv.dat'                                             
if exists(varfile):                                                         
     mincvt(varfile)                                      
EOF
chmod u+x mincv.py
# The output of mincv.py is in basepoint
# basepoint along with peptide name is also concatenated to cvbasepoints file
cat << EOF > relative_cv.py
#!/usr/bin/env python
import numpy as np
f1=np.genfromtxt("modified_infopeak")
f22=np.genfromtxt("basepoint")
final = np.zeros([f1.shape[0],3])
final[:,0:2] = f1
final[:,2] = f1[:,1]-f22[0]
np.savetxt("3col.txt",final)
EOF
chmod u+x relative_cv.py
# The output of relative_cv.py is 3col.txt which is renamed in 
# 3cv_ana_run_pathsample.sh to contain the peptide directory name
# and is moved to pythondata folder. It contains the relative peak heights
# in third column
cat << EOF > nocap.pml                                                         
load coords.top, mol                                                            
load extractedmindummy.rst, mol                                                 
show sticks                                                                     
hide cartoon                                                                    
select myres1, resi 1                                                           
select myres2, resi 2                                                           
select myres3, resi 3                                                           
select myres4, resi 4                                                           
select myres5, resi 5                                                           
select myres6, resi 6                                                           
color deeppurple, myres1
color teal, myres2
color gray, myres3
color gray, myres4
color carbon, myres5
color yellow, myres6
set ray_trace_fog, 0                                                            
set ray_shadows, 0                                                              
unset depth_cue                                                                 
bg_color white                                                                  
set antialias, 2                                                                
set hash_max, 300                                                               
set ray_trace_mode, 3                                                           
set ray_trace_color, black                                                      
set ray_opaque_background, off                                                  
EOF
cat << EOF > cap.pml                                                         
load coords.top, mol                                                            
load extractedmindummy.rst, mol                                                 
show sticks                                                                     
hide cartoon                                                                    
select myres1, resi 1                                                            
select myres2, resi 2                                                           
select myres3, resi 3                                                           
select myres4, resi 4                                                           
select myres5, resi 5                                                           
select myres6, resi 6                                                           
select myres7, resi 7                                                           
select myres8, resi 8                                                            
color black, myres1                                                             
color black, myres8                                                              
color deeppurple, myres2                                                            
color teal, myres3                                                            
color gray, myres4                                                              
color gray, myres5                                                              
color carbon, myres6                                                         
color yellow, myres7                                                            
set ray_trace_fog, 0                                                            
set ray_shadows, 0                                                              
unset depth_cue                                                                 
bg_color white                                                                  
set antialias, 2                                                                
set hash_max, 300                                                               
set ray_trace_mode, 3                                                           
set ray_trace_color, black                                                      
set ray_opaque_background, off                                                  
EOF
cat << EOF > pathdataA12_extractminfile
NATOMS dof
EXTRACTMINFILE
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
cat << EOF > odataA12decompe
DEBUG                                                                          
UPDATES 175                                                                    
MAXBFGS 0.0                                                                    
BFGSSTEPS 1                                                                    
BFGSMIN 1.0D100                                                                
A12DECOMPE                                                                     
MULTIJOB extractedmin                                                          
AMBER12 start
EOF
cat << EOF > pathdata_A20dummy
NATOMS dof
CV 0.01 1.2 0.001
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
cat << EOF > pathdata_A20dummy_removesp
NATOMS dof
REMOVESP
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
cat << EOF > pathdataA20_extractminfile
NATOMS dof
EXTRACTMINFILE
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
cat << EOF > odataA20decompe
DEBUG                                                                          
UPDATES 175                                                                    
MAXBFGS 0.0                                                                    
BFGSSTEPS 1                                                                    
BFGSMIN 1.0D100                                                                
A20DECOMPE                                                                     
MULTIJOB extractedmin                                                          
AMBER20 start
EOF
cat << EOF > dinfooverall
autorange
delta 1.0
minima min.data
ts ts.data
EOF
cat << EOF > dimercap.pml
load coords.top, mol                                                            
load extractedmindummy.rst, mol                                                 
show sticks                                                                     
hide cartoon                                                                    
select myres1, resi 1                                                            
select myres2, resi 2                                                           
select myres3, resi 3                                                           
select myres4, resi 4                                                           
select myres5, resi 5                                                           
select myres6, resi 6                                                           
select myres7, resi 7                                                           
select myres8, resi 8                                                            
color black, myres1                                                             
color black, myres8                                                              
color deeppurple, myres2                                                            
color teal, myres3                                                            
color gray, myres4                                                              
color gray, myres5                                                              
color carbon, myres6                                                         
color yellow, myres7                                                            
select myres9, resi 9                                                            
select myres10, resi 10                                                           
select myres11, resi 11                                                           
select myres12, resi 12                                                           
select myres13, resi 13                                                           
select myres14, resi 14                                                           
select myres15, resi 15                                                           
select myres16, resi 16                                                            
color black, myres9                                                             
color black, myres16                                                              
color deeppurple, myres10                                                            
color teal, myres11                                                            
color gray, myres12                                                              
color gray, myres13                                                              
color carbon, myres14                                                         
color yellow, myres15                                                            
set ray_trace_fog, 0                                                            
set ray_shadows, 0                                                              
unset depth_cue                                                                 
bg_color white                                                                  
set antialias, 2                                                                
set hash_max, 300                                                               
set ray_trace_mode, 3                                                           
set ray_trace_color, black                                                      
set ray_opaque_background, off                                                  
EOF
