#!/bin/bash
dir="/sharedscratch/nn320/cv_analysis_on_allDB"
cat << EOF > dimerdirs
dimer_nlgpvl_99idps_cap/full_cv/peak2
dimer_liagfn_99idps_cap/full_cv/peak4
dimer_stviie_99idps_cap/full_cv/peak1
dimer_stviip_99idps_cap/full_cv/peak2
dimer_stvvie_99idps_cap/full_cv/peak2
dimer_spviie_99idps_cap/full_cv/peak2
dimer_vqivyk_99idps_cap/full_cv/peak2
dimer_vqivek_99idps_cap/full_cv/peak2
dimer_lyqlen_99idps_cap/full_cv/infl1
dimer_llyyte_99idps_cap/full_cv/peak2
dimer_naevyk_99idps_cap/full_cv/peak4
dimer_yqleny_99idps_cap/full_cv/infl1
dimer_yyteft_99idps_cap/full_cv/peak3
dimer_nfgail_99idps_cap/full_cv/infl1
dimer_nagail_99idps_cap/full_cv/peak2
EOF
cd $dir
cat << EOF > incalcdist
trajin minima.mdcrd                                                            
distance e2em1 :2@N :7@C out dimerm1.out 
dihedral dhdm1 :2@CA :4@CA :5@CA :7@CA out dimerm1.out
distance e2em2 :10@N :15@C out dimerm2.out 
dihedral dhdm2 :10@CA :12@CA :13@CA :15@CA out dimerm2.out
EOF
for j in $(cat dimerdirs)
do
    mkdir $dir/$j/cpptrajanalysis
    cd $dir/$j/cpptrajanalysis
    cp $dir/incalcdist .
    cp ../min.minus ../min.plus .
    cat min.minus min.plus > allminpeak1
    sort -k 1n allminpeak1 > allminpeak1sorted
    rm allminpeak1
    cp ../min.data ../coords.prmtop ../coords.inpcrd ../points.min .
    awk '{print NR, $1}' min.data > minnoenergy
    for i in $(cat allminpeak1sorted)
    do
        sed -n "$i"p minnoenergy | awk '{print $1, $2}' >> minenergy
    done
    rm minnoenergy allminpeak1sorted
    globalmin=$(sort -k 1n min.data | head -n 1 | awk '{print $1}')
    minofinterest=$(echo "$globalmin + 2.6" | bc)
    awk -v var=$minofinterest '$2<=var {print $1, $2}' minenergy > forcalc
    #cp minenergy forcalc
    awk '{print $1}' forcalc > forcpptraj
    rm minenergy forcalc
    cppdir="/sharedscratch/nn320/softwarewales/cpptraj-master/bin"
    atoms=$(head -n 2 coords.inpcrd | tail -n 1| awk '{print $1}')
    cp coords.prmtop ambercoords.prmtop
    sed -i 2d ambercoords.prmtop
    sed -i 2d ambercoords.prmtop
    sed -i 2d ambercoords.prmtop
    sed -i 2d ambercoords.prmtop
    sed -i 2d ambercoords.prmtop
    dump_mdcrd $atoms
    $cppdir/cpptraj -i incalcdist -p ambercoords.prmtop
    sed -i 1d dimerm1.out
    sed -i 1d dimerm2.out
    for i in $(cat forcpptraj)
    do
        sed -n "$i"p dimerm1.out >> m1.out
        sed -n "$i"p dimerm2.out >> m2.out
    done
    cat m1.out m2.out > bothmonomer.out
    currentdir=$(pwd | cut -d "/" -f 5)
    cp bothmonomer.out $dir/dimer_cpptraj/"$currentdir"bothmonomer.out
    rm dimerm1.out dimerm2.out m1.out m2.out incalcdist
    cd $dir
done
