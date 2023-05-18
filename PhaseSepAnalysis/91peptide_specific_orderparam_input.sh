#!/bin/bash

# The peptidename file contains the sequence of amino acid residues
# in the peptide. The sequence is denoted by 1 letter code in upper case

# The input_order_parameter file can have the following lines
# Of course, the lines in file do not start with hash(#) 
# These 3 input files are for nocapped peptides
# For capped peptides, the residue numbers, totalatoms will change

dir="/sharedscratch/nn320/cv_analysis_on_allDB"
dir1=$1
subdir="orderparam"
cd $dir/$1/$subdir
cat << EOF > peptidename_yyggyy_nocap
YYGGYYnocap
EOF
cat << EOF > input_order_parameter_yyggyy_nocap
YYGGYYnocap PLANERESIDUE 1 CG CD1 CE1 CZ CE2 CD2
YYGGYYnocap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
YYGGYYnocap PLANERESIDUE 5 CG CD1 CE1 CZ CE2 CD2
YYGGYYnocap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
YYGGYYnocap BACKBONE 1 C O
YYGGYYnocap BACKBONE 2 C O
YYGGYYnocap BACKBONE 3 C O
YYGGYYnocap BACKBONE 4 C O
YYGGYYnocap BACKBONE 5 C O
YYGGYYnocap BACKBONE 6 C O
YYGGYYnocap PAIRS 1 2
YYGGYYnocap PAIRS 1 5
YYGGYYnocap PAIRS 1 6
YYGGYYnocap PAIRS 2 5
YYGGYYnocap PAIRS 2 6
YYGGYYnocap PAIRS 5 6
YYGGYYnocap PAIRS 2 1
YYGGYYnocap PAIRS 5 1
YYGGYYnocap PAIRS 6 1
YYGGYYnocap PAIRS 5 2
YYGGYYnocap PAIRS 6 2
YYGGYYnocap PAIRS 6 5
YYGGYYnocap PAIR 1 2
YYGGYYnocap PAIR 1 5
YYGGYYnocap PAIR 1 6
YYGGYYnocap PAIR 2 5
YYGGYYnocap PAIR 2 6
YYGGYYnocap PAIR 5 6
YYGGYYnocap TOTALATOMS 101
EOF
cat << EOF > peptidename_ffggff_nocap
FFGGFFnocap
EOF
cat << EOF > input_order_parameter_ffggff_nocap
FFGGFFnocap PLANERESIDUE 1 CG CD1 CE1 CZ CE2 CD2
FFGGFFnocap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
FFGGFFnocap PLANERESIDUE 5 CG CD1 CE1 CZ CE2 CD2
FFGGFFnocap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
FFGGFFnocap BACKBONE 1 C O
FFGGFFnocap BACKBONE 2 C O
FFGGFFnocap BACKBONE 3 C O
FFGGFFnocap BACKBONE 4 C O
FFGGFFnocap BACKBONE 5 C O
FFGGFFnocap BACKBONE 6 C O
FFGGFFnocap PAIRS 1 2
FFGGFFnocap PAIRS 1 5
FFGGFFnocap PAIRS 1 6
FFGGFFnocap PAIRS 2 5
FFGGFFnocap PAIRS 2 6
FFGGFFnocap PAIRS 5 6
FFGGFFnocap PAIRS 2 1
FFGGFFnocap PAIRS 5 1
FFGGFFnocap PAIRS 6 1
FFGGFFnocap PAIRS 5 2
FFGGFFnocap PAIRS 6 2
FFGGFFnocap PAIRS 6 5
FFGGFFnocap PAIR 1 2
FFGGFFnocap PAIR 1 5
FFGGFFnocap PAIR 1 6
FFGGFFnocap PAIR 2 5
FFGGFFnocap PAIR 2 6
FFGGFFnocap PAIR 5 6
FFGGFFnocap TOTALATOMS 97
EOF
cat << EOF > peptidename_yrggry_nocap
YRGGRYnocap
EOF
cat << EOF > input_order_parameter_yrggry_nocap
YRGGRYnocap PLANERESIDUE 1 CG CD1 CE1 CZ CE2 CD2
YRGGRYnocap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
YRGGRYnocap BACKBONE 1 C O
YRGGRYnocap BACKBONE 2 C O
YRGGRYnocap BACKBONE 3 C O
YRGGRYnocap BACKBONE 4 C O
YRGGRYnocap BACKBONE 5 C O
YRGGRYnocap BACKBONE 6 C O
YRGGRYnocap PAIRS 1 6
YRGGRYnocap PAIRS 6 1
YRGGRYnocap PAIR 1 6
YRGGRYnocap CATIONPI 1 2
YRGGRYnocap CATIONPI 1 5
YRGGRYnocap CATIONPI 6 2
YRGGRYnocap CATIONPI 6 5
YRGGRYnocap CATIONCATION 2 5
YRGGRYnocap TOTALATOMS 107
EOF
cat << EOF > peptidename_ryggyr_nocap
RYGGYRnocap
EOF
cat << EOF > input_order_parameter_ryggyr_nocap
RYGGYRnocap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
RYGGYRnocap PLANERESIDUE 5 CG CD1 CE1 CZ CE2 CD2
RYGGYRnocap BACKBONE 1 C O
RYGGYRnocap BACKBONE 2 C O
RYGGYRnocap BACKBONE 3 C O
RYGGYRnocap BACKBONE 4 C O
RYGGYRnocap BACKBONE 5 C O
RYGGYRnocap BACKBONE 6 C O
RYGGYRnocap PAIRS 2 5
RYGGYRnocap PAIRS 5 2
RYGGYRnocap PAIR 2 5
RYGGYRnocap CATIONPI 2 1
RYGGYRnocap CATIONPI 2 6
RYGGYRnocap CATIONPI 5 1
RYGGYRnocap CATIONPI 5 6
RYGGYRnocap CATIONCATION 1 6
RYGGYRnocap TOTALATOMS 107
EOF
cat << EOF > peptidename_kyggyk_nocap
KYGGYKnocap
EOF
cat << EOF > input_order_parameter_kyggyk_nocap
KYGGYKnocap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
KYGGYKnocap PLANERESIDUE 5 CG CD1 CE1 CZ CE2 CD2
KYGGYKnocap BACKBONE 1 C O
KYGGYKnocap BACKBONE 2 C O
KYGGYKnocap BACKBONE 3 C O
KYGGYKnocap BACKBONE 4 C O
KYGGYKnocap BACKBONE 5 C O
KYGGYKnocap BACKBONE 6 C O
KYGGYKnocap PAIRS 2 5
KYGGYKnocap PAIRS 5 2
KYGGYKnocap PAIR 2 5
KYGGYKnocap CATIONPI 2 1
KYGGYKnocap CATIONPI 2 6
KYGGYKnocap CATIONPI 5 1
KYGGYKnocap CATIONPI 5 6
KYGGYKnocap CATIONCATION 1 6
KYGGYKnocap TOTALATOMS 103
EOF
cat << EOF > peptidename_ykggky_nocap
YKGGKYnocap
EOF
cat << EOF > input_order_parameter_ykggky_nocap
YKGGKYnocap PLANERESIDUE 1 CG CD1 CE1 CZ CE2 CD2
YKGGKYnocap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
YKGGKYnocap BACKBONE 1 C O
YKGGKYnocap BACKBONE 2 C O
YKGGKYnocap BACKBONE 3 C O
YKGGKYnocap BACKBONE 4 C O
YKGGKYnocap BACKBONE 5 C O
YKGGKYnocap BACKBONE 6 C O
YKGGKYnocap PAIRS 1 6
YKGGKYnocap PAIRS 6 1
YKGGKYnocap PAIR 1 6
YKGGKYnocap CATIONPI 1 2
YKGGKYnocap CATIONPI 1 5
YKGGKYnocap CATIONPI 6 2
YKGGKYnocap CATIONPI 6 5
YKGGKYnocap CATIONCATION 2 5
YKGGKYnocap TOTALATOMS 103
EOF
cat << EOF > peptidename_yyggyy_cap
YYGGYYcap
EOF
cat << EOF > input_order_parameter_yyggyy_cap
YYGGYYcap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
YYGGYYcap PLANERESIDUE 3 CG CD1 CE1 CZ CE2 CD2
YYGGYYcap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
YYGGYYcap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
YYGGYYcap BACKBONE 2 C O
YYGGYYcap BACKBONE 3 C O
YYGGYYcap BACKBONE 4 C O
YYGGYYcap BACKBONE 5 C O
YYGGYYcap BACKBONE 6 C O
YYGGYYcap BACKBONE 7 C O
YYGGYYcap PAIRS 2 3
YYGGYYcap PAIRS 2 6
YYGGYYcap PAIRS 2 7
YYGGYYcap PAIRS 3 6
YYGGYYcap PAIRS 3 7
YYGGYYcap PAIRS 6 7
YYGGYYcap PAIRS 3 2
YYGGYYcap PAIRS 6 2
YYGGYYcap PAIRS 7 2
YYGGYYcap PAIRS 6 3
YYGGYYcap PAIRS 7 3
YYGGYYcap PAIRS 7 6
YYGGYYcap PAIR 2 3
YYGGYYcap PAIR 2 6
YYGGYYcap PAIR 2 7
YYGGYYcap PAIR 3 6
YYGGYYcap PAIR 3 7
YYGGYYcap PAIR 6 7
YYGGYYcap TOTALATOMS 110
EOF
cat << EOF > peptidename_ffggff_cap
FFGGFFcap
EOF
cat << EOF > input_order_parameter_ffggff_cap
FFGGFFcap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
FFGGFFcap PLANERESIDUE 3 CG CD1 CE1 CZ CE2 CD2
FFGGFFcap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
FFGGFFcap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
FFGGFFcap BACKBONE 2 C O
FFGGFFcap BACKBONE 3 C O
FFGGFFcap BACKBONE 4 C O
FFGGFFcap BACKBONE 5 C O
FFGGFFcap BACKBONE 6 C O
FFGGFFcap BACKBONE 7 C O
FFGGFFcap PAIRS 2 3
FFGGFFcap PAIRS 2 6
FFGGFFcap PAIRS 2 7
FFGGFFcap PAIRS 3 6
FFGGFFcap PAIRS 3 7
FFGGFFcap PAIRS 6 7
FFGGFFcap PAIRS 3 2
FFGGFFcap PAIRS 6 2
FFGGFFcap PAIRS 7 2
FFGGFFcap PAIRS 6 3
FFGGFFcap PAIRS 7 3
FFGGFFcap PAIRS 7 6
FFGGFFcap PAIR 2 3
FFGGFFcap PAIR 2 6
FFGGFFcap PAIR 2 7
FFGGFFcap PAIR 3 6
FFGGFFcap PAIR 3 7
FFGGFFcap PAIR 6 7
FFGGFFcap TOTALATOMS 106
EOF
cat << EOF > peptidename_yrggry_cap
YRGGRYcap
EOF
cat << EOF > input_order_parameter_yrggry_cap
YRGGRYcap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
YRGGRYcap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
YRGGRYcap BACKBONE 2 C O
YRGGRYcap BACKBONE 3 C O
YRGGRYcap BACKBONE 4 C O
YRGGRYcap BACKBONE 5 C O
YRGGRYcap BACKBONE 6 C O
YRGGRYcap BACKBONE 7 C O
YRGGRYcap PAIRS 2 7
YRGGRYcap PAIRS 7 2
YRGGRYcap PAIR 2 7
YRGGRYcap CATIONPI 2 3
YRGGRYcap CATIONPI 2 6
YRGGRYcap CATIONPI 7 3
YRGGRYcap CATIONPI 7 6
YRGGRYcap CATIONCATION 3 6
YRGGRYcap TOTALATOMS 116
EOF
cat << EOF > peptidename_ryggyr_cap
RYGGYRcap
EOF
cat << EOF > input_order_parameter_ryggyr_cap
RYGGYRcap PLANERESIDUE 3 CG CD1 CE1 CZ CE2 CD2
RYGGYRcap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
RYGGYRcap BACKBONE 2 C O
RYGGYRcap BACKBONE 3 C O
RYGGYRcap BACKBONE 4 C O
RYGGYRcap BACKBONE 5 C O
RYGGYRcap BACKBONE 6 C O
RYGGYRcap BACKBONE 7 C O
RYGGYRcap PAIRS 3 6
RYGGYRcap PAIRS 6 3
RYGGYRcap PAIR 3 6
RYGGYRcap CATIONPI 3 2
RYGGYRcap CATIONPI 3 7
RYGGYRcap CATIONPI 6 2
RYGGYRcap CATIONPI 6 7
RYGGYRcap CATIONCATION 2 7
RYGGYRcap TOTALATOMS 116
EOF
cat << EOF > peptidename_kyggyk_cap
KYGGYKcap
EOF
cat << EOF > input_order_parameter_kyggyk_cap
KYGGYKcap PLANERESIDUE 3 CG CD1 CE1 CZ CE2 CD2
KYGGYKcap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
KYGGYKcap BACKBONE 2 C O
KYGGYKcap BACKBONE 3 C O
KYGGYKcap BACKBONE 4 C O
KYGGYKcap BACKBONE 5 C O
KYGGYKcap BACKBONE 6 C O
KYGGYKcap BACKBONE 7 C O
KYGGYKcap PAIRS 3 6
KYGGYKcap PAIRS 6 3
KYGGYKcap PAIR 3 6
KYGGYKcap CATIONPI 3 2
KYGGYKcap CATIONPI 3 7
KYGGYKcap CATIONPI 6 2
KYGGYKcap CATIONPI 6 7
KYGGYKcap CATIONCATION 2 7
KYGGYKcap TOTALATOMS 112
EOF
cat << EOF > peptidename_ykggky_cap
YKGGKYcap
EOF
cat << EOF > input_order_parameter_ykggky_cap
YKGGKYcap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
YKGGKYcap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
YKGGKYcap BACKBONE 2 C O
YKGGKYcap BACKBONE 3 C O
YKGGKYcap BACKBONE 4 C O
YKGGKYcap BACKBONE 5 C O
YKGGKYcap BACKBONE 6 C O
YKGGKYcap BACKBONE 7 C O
YKGGKYcap PAIRS 2 7
YKGGKYcap PAIRS 7 2
YKGGKYcap PAIR 2 7
YKGGKYcap CATIONPI 2 3
YKGGKYcap CATIONPI 2 6
YKGGKYcap CATIONPI 7 3
YKGGKYcap CATIONPI 7 6
YKGGKYcap CATIONCATION 3 6
YKGGKYcap TOTALATOMS 112
EOF
cat << EOF > peptidename_dimeryyggyy_nocap
dimerYYGGYYnocap
EOF
cat << EOF > input_order_parameter_dimeryyggyy_nocap
dimerYYGGYYnocap PLANERESIDUE 1 CG CD1 CE1 CZ CE2 CD2
dimerYYGGYYnocap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
dimerYYGGYYnocap PLANERESIDUE 5 CG CD1 CE1 CZ CE2 CD2
dimerYYGGYYnocap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
dimerYYGGYYnocap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
dimerYYGGYYnocap PLANERESIDUE 8 CG CD1 CE1 CZ CE2 CD2
dimerYYGGYYnocap PLANERESIDUE 11 CG CD1 CE1 CZ CE2 CD2
dimerYYGGYYnocap PLANERESIDUE 12 CG CD1 CE1 CZ CE2 CD2
dimerYYGGYYnocap BACKBONE 1 C O
dimerYYGGYYnocap BACKBONE 2 C O
dimerYYGGYYnocap BACKBONE 3 C O
dimerYYGGYYnocap BACKBONE 4 C O
dimerYYGGYYnocap BACKBONE 5 C O
dimerYYGGYYnocap BACKBONE 6 C O
dimerYYGGYYnocap BACKBONE 7 C O
dimerYYGGYYnocap BACKBONE 8 C O
dimerYYGGYYnocap BACKBONE 9 C O
dimerYYGGYYnocap BACKBONE 10 C O
dimerYYGGYYnocap BACKBONE 11 C O
dimerYYGGYYnocap BACKBONE 12 C O
dimerYYGGYYnocap PAIRS 1 2
dimerYYGGYYnocap PAIRS 1 5
dimerYYGGYYnocap PAIRS 1 6
dimerYYGGYYnocap PAIRS 2 5
dimerYYGGYYnocap PAIRS 2 6
dimerYYGGYYnocap PAIRS 5 6
dimerYYGGYYnocap PAIRS 2 1
dimerYYGGYYnocap PAIRS 5 1
dimerYYGGYYnocap PAIRS 6 1
dimerYYGGYYnocap PAIRS 5 2
dimerYYGGYYnocap PAIRS 6 2
dimerYYGGYYnocap PAIRS 6 5
dimerYYGGYYnocap PAIR 1 2
dimerYYGGYYnocap PAIR 1 5
dimerYYGGYYnocap PAIR 1 6
dimerYYGGYYnocap PAIR 2 5
dimerYYGGYYnocap PAIR 2 6
dimerYYGGYYnocap PAIR 5 6
dimerYYGGYYnocap PAIR 1 7
dimerYYGGYYnocap PAIR 1 8
dimerYYGGYYnocap PAIR 1 11
dimerYYGGYYnocap PAIR 1 12
dimerYYGGYYnocap PAIR 2 7
dimerYYGGYYnocap PAIR 2 8
dimerYYGGYYnocap PAIR 2 11
dimerYYGGYYnocap PAIR 2 12
dimerYYGGYYnocap PAIR 5 7
dimerYYGGYYnocap PAIR 5 8 
dimerYYGGYYnocap PAIR 5 11
dimerYYGGYYnocap PAIR 5 12
dimerYYGGYYnocap PAIR 6 7
dimerYYGGYYnocap PAIR 6 8
dimerYYGGYYnocap PAIR 6 11
dimerYYGGYYnocap PAIR 6 12
dimerYYGGYYnocap PAIR 7 8
dimerYYGGYYnocap PAIR 7 11
dimerYYGGYYnocap PAIR 7 12
dimerYYGGYYnocap PAIR 8 11
dimerYYGGYYnocap PAIR 8 12
dimerYYGGYYnocap PAIR 11 12
dimerYYGGYYnocap TOTALATOMS 202
EOF
cat << EOF > peptidename_fggggf_cap
FGGGGFcap
EOF
cat << EOF > input_order_parameter_fggggf_cap
FGGGGFcap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
FGGGGFcap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
FGGGGFcap BACKBONE 2 C O
FGGGGFcap BACKBONE 3 C O
FGGGGFcap BACKBONE 4 C O
FGGGGFcap BACKBONE 5 C O
FGGGGFcap BACKBONE 6 C O
FGGGGFcap BACKBONE 7 C O
FGGGGFcap PAIRS 2 7
FGGGGFcap PAIRS 7 2
FGGGGFcap PAIR 2 7
FGGGGFcap TOTALATOMS 80
EOF
cat << EOF > peptidename_yggggy_cap
YGGGGYcap
EOF
cat << EOF > input_order_parameter_yggggy_cap
YGGGGYcap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
YGGGGYcap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
YGGGGYcap BACKBONE 2 C O
YGGGGYcap BACKBONE 3 C O
YGGGGYcap BACKBONE 4 C O
YGGGGYcap BACKBONE 5 C O
YGGGGYcap BACKBONE 6 C O
YGGGGYcap BACKBONE 7 C O
YGGGGYcap PAIRS 2 7
YGGGGYcap PAIRS 7 2
YGGGGYcap PAIR 2 7
YGGGGYcap TOTALATOMS 82
EOF
cat << EOF > peptidename_fggggy_cap
FGGGGYcap
EOF
cat << EOF > input_order_parameter_fggggy_cap
FGGGGYcap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
FGGGGYcap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
FGGGGYcap BACKBONE 2 C O
FGGGGYcap BACKBONE 3 C O
FGGGGYcap BACKBONE 4 C O
FGGGGYcap BACKBONE 5 C O
FGGGGYcap BACKBONE 6 C O
FGGGGYcap BACKBONE 7 C O
FGGGGYcap PAIRS 2 7
FGGGGYcap PAIRS 7 2
FGGGGYcap PAIR 2 7
FGGGGYcap TOTALATOMS 81
EOF
cat << EOF > peptidename_yggggf_cap
YGGGGFcap
EOF
cat << EOF > input_order_parameter_yggggf_cap
YGGGGFcap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
YGGGGFcap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
YGGGGFcap BACKBONE 2 C O
YGGGGFcap BACKBONE 3 C O
YGGGGFcap BACKBONE 4 C O
YGGGGFcap BACKBONE 5 C O
YGGGGFcap BACKBONE 6 C O
YGGGGFcap BACKBONE 7 C O
YGGGGFcap PAIRS 2 7
YGGGGFcap PAIRS 7 2
YGGGGFcap PAIR 2 7
YGGGGFcap TOTALATOMS 81
EOF
cat << EOF > peptidename_yggggr_cap
YGGGGRcap
EOF
cat << EOF > input_order_parameter_yggggr_cap
YGGGGRcap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
YGGGGRcap BACKBONE 2 C O
YGGGGRcap BACKBONE 3 C O
YGGGGRcap BACKBONE 4 C O
YGGGGRcap BACKBONE 5 C O
YGGGGRcap BACKBONE 6 C O
YGGGGRcap BACKBONE 7 C O
YGGGGRcap CATIONPI 2 7
YGGGGRcap TOTALATOMS 85
EOF
cat << EOF > peptidename_rggggy_cap
RGGGGYcap
EOF
cat << EOF > input_order_parameter_rggggy_cap
RGGGGYcap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
RGGGGYcap BACKBONE 2 C O
RGGGGYcap BACKBONE 3 C O
RGGGGYcap BACKBONE 4 C O
RGGGGYcap BACKBONE 5 C O
RGGGGYcap BACKBONE 6 C O
RGGGGYcap BACKBONE 7 C O
RGGGGYcap CATIONPI 7 2
RGGGGYcap TOTALATOMS 85
EOF
cat << EOF > peptidename_kggggy_cap
KGGGGYcap
EOF
cat << EOF > input_order_parameter_kggggy_cap
KGGGGYcap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
KGGGGYcap BACKBONE 2 C O
KGGGGYcap BACKBONE 3 C O
KGGGGYcap BACKBONE 4 C O
KGGGGYcap BACKBONE 5 C O
KGGGGYcap BACKBONE 6 C O
KGGGGYcap BACKBONE 7 C O
KGGGGYcap CATIONPI 7 2
KGGGGYcap TOTALATOMS 83
EOF
cat << EOF > peptidename_yggggk_cap
YGGGGKcap
EOF
cat << EOF > input_order_parameter_yggggk_cap
YGGGGKcap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
YGGGGKcap BACKBONE 2 C O
YGGGGKcap BACKBONE 3 C O
YGGGGKcap BACKBONE 4 C O
YGGGGKcap BACKBONE 5 C O
YGGGGKcap BACKBONE 6 C O
YGGGGKcap BACKBONE 7 C O
YGGGGKcap CATIONPI 2 7
YGGGGKcap TOTALATOMS 83
EOF
cat << EOF > peptidename_fggggr_cap
FGGGGRcap
EOF
cat << EOF > input_order_parameter_fggggr_cap
FGGGGRcap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
FGGGGRcap BACKBONE 2 C O
FGGGGRcap BACKBONE 3 C O
FGGGGRcap BACKBONE 4 C O
FGGGGRcap BACKBONE 5 C O
FGGGGRcap BACKBONE 6 C O
FGGGGRcap BACKBONE 7 C O
FGGGGRcap CATIONPI 2 7
FGGGGRcap TOTALATOMS 84
EOF
cat << EOF > peptidename_rggggf_cap
RGGGGFcap
EOF
cat << EOF > input_order_parameter_rggggf_cap
RGGGGFcap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
RGGGGFcap BACKBONE 2 C O
RGGGGFcap BACKBONE 3 C O
RGGGGFcap BACKBONE 4 C O
RGGGGFcap BACKBONE 5 C O
RGGGGFcap BACKBONE 6 C O
RGGGGFcap BACKBONE 7 C O
RGGGGFcap CATIONPI 7 2
RGGGGFcap TOTALATOMS 84
EOF
cat << EOF > peptidename_kggggf_cap
KGGGGFcap
EOF
cat << EOF > input_order_parameter_kggggf_cap
KGGGGFcap PLANERESIDUE 7 CG CD1 CE1 CZ CE2 CD2
KGGGGFcap BACKBONE 2 C O
KGGGGFcap BACKBONE 3 C O
KGGGGFcap BACKBONE 4 C O
KGGGGFcap BACKBONE 5 C O
KGGGGFcap BACKBONE 6 C O
KGGGGFcap BACKBONE 7 C O
KGGGGFcap CATIONPI 7 2
KGGGGFcap TOTALATOMS 82
EOF
cat << EOF > peptidename_fggggk_cap
FGGGGKcap
EOF
cat << EOF > input_order_parameter_fggggk_cap
FGGGGKcap PLANERESIDUE 2 CG CD1 CE1 CZ CE2 CD2
FGGGGKcap BACKBONE 2 C O
FGGGGKcap BACKBONE 3 C O
FGGGGKcap BACKBONE 4 C O
FGGGGKcap BACKBONE 5 C O
FGGGGKcap BACKBONE 6 C O
FGGGGKcap BACKBONE 7 C O
FGGGGKcap CATIONPI 2 7
FGGGGKcap TOTALATOMS 82
EOF
cat << EOF > peptidename_gfggfg_cap
GFGGFGcap
EOF
cat << EOF > input_order_parameter_gfggfg_cap
GFGGFGcap PLANERESIDUE 3 CG CD1 CE1 CZ CE2 CD2
GFGGFGcap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
GFGGFGcap BACKBONE 2 C O
GFGGFGcap BACKBONE 3 C O
GFGGFGcap BACKBONE 4 C O
GFGGFGcap BACKBONE 5 C O
GFGGFGcap BACKBONE 6 C O
GFGGFGcap BACKBONE 7 C O
GFGGFGcap PAIRS 3 6
GFGGFGcap PAIRS 6 3
GFGGFGcap PAIR 3 6
GFGGFGcap TOTALATOMS 80
EOF
cat << EOF > peptidename_gyggyg_cap
GYGGYGcap
EOF
cat << EOF > input_order_parameter_gyggyg_cap
GYGGYGcap PLANERESIDUE 3 CG CD1 CE1 CZ CE2 CD2
GYGGYGcap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
GYGGYGcap BACKBONE 2 C O
GYGGYGcap BACKBONE 3 C O
GYGGYGcap BACKBONE 4 C O
GYGGYGcap BACKBONE 5 C O
GYGGYGcap BACKBONE 6 C O
GYGGYGcap BACKBONE 7 C O
GYGGYGcap PAIRS 3 6
GYGGYGcap PAIRS 6 3
GYGGYGcap PAIR 3 6
GYGGYGcap TOTALATOMS 82
EOF
cat << EOF > peptidename_gfggyg_cap
GFGGYGcap
EOF
cat << EOF > input_order_parameter_gfggyg_cap
GFGGYGcap PLANERESIDUE 3 CG CD1 CE1 CZ CE2 CD2
GFGGYGcap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
GFGGYGcap BACKBONE 2 C O
GFGGYGcap BACKBONE 3 C O
GFGGYGcap BACKBONE 4 C O
GFGGYGcap BACKBONE 5 C O
GFGGYGcap BACKBONE 6 C O
GFGGYGcap BACKBONE 7 C O
GFGGYGcap PAIRS 3 6
GFGGYGcap PAIRS 6 3
GFGGYGcap PAIR 3 6
GFGGYGcap TOTALATOMS 81
EOF
cat << EOF > peptidename_gyggfg_cap
GYGGFGcap
EOF
cat << EOF > input_order_parameter_gyggfg_cap
GYGGFGcap PLANERESIDUE 3 CG CD1 CE1 CZ CE2 CD2
GYGGFGcap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
GYGGFGcap BACKBONE 2 C O
GYGGFGcap BACKBONE 3 C O
GYGGFGcap BACKBONE 4 C O
GYGGFGcap BACKBONE 5 C O
GYGGFGcap BACKBONE 6 C O
GYGGFGcap BACKBONE 7 C O
GYGGFGcap PAIRS 3 6
GYGGFGcap PAIRS 6 3
GYGGFGcap PAIR 3 6
GYGGFGcap TOTALATOMS 81
EOF
cat << EOF > peptidename_gyggrg_cap
GYGGRGcap
EOF
cat << EOF > input_order_parameter_gyggrg_cap
GYGGRGcap PLANERESIDUE 3 CG CD1 CE1 CZ CE2 CD2
GYGGRGcap BACKBONE 2 C O
GYGGRGcap BACKBONE 3 C O
GYGGRGcap BACKBONE 4 C O
GYGGRGcap BACKBONE 5 C O
GYGGRGcap BACKBONE 6 C O
GYGGRGcap BACKBONE 7 C O
GYGGRGcap CATIONPI 3 6
GYGGRGcap TOTALATOMS 85
EOF
cat << EOF > peptidename_grggyg_cap
GRGGYGcap
EOF
cat << EOF > input_order_parameter_grggyg_cap
GRGGYGcap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
GRGGYGcap BACKBONE 2 C O
GRGGYGcap BACKBONE 3 C O
GRGGYGcap BACKBONE 4 C O
GRGGYGcap BACKBONE 5 C O
GRGGYGcap BACKBONE 6 C O
GRGGYGcap BACKBONE 7 C O
GRGGYGcap CATIONPI 6 3
GRGGYGcap TOTALATOMS 85
EOF
cat << EOF > peptidename_gkggyg_cap
GKGGYGcap
EOF
cat << EOF > input_order_parameter_gkggyg_cap
GKGGYGcap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
GKGGYGcap BACKBONE 2 C O
GKGGYGcap BACKBONE 3 C O
GKGGYGcap BACKBONE 4 C O
GKGGYGcap BACKBONE 5 C O
GKGGYGcap BACKBONE 6 C O
GKGGYGcap BACKBONE 7 C O
GKGGYGcap CATIONPI 6 3
GKGGYGcap TOTALATOMS 83
EOF
cat << EOF > peptidename_gyggkg_cap
GYGGKGcap
EOF
cat << EOF > input_order_parameter_gyggkg_cap
GYGGKGcap PLANERESIDUE 3 CG CD1 CE1 CZ CE2 CD2
GYGGKGcap BACKBONE 2 C O
GYGGKGcap BACKBONE 3 C O
GYGGKGcap BACKBONE 4 C O
GYGGKGcap BACKBONE 5 C O
GYGGKGcap BACKBONE 6 C O
GYGGKGcap BACKBONE 7 C O
GYGGKGcap CATIONPI 3 6
GYGGKGcap TOTALATOMS 83
EOF
cat << EOF > peptidename_gfggrg_cap
GFGGRGcap
EOF
cat << EOF > input_order_parameter_gfggrg_cap
GFGGRGcap PLANERESIDUE 3 CG CD1 CE1 CZ CE2 CD2
GFGGRGcap BACKBONE 2 C O
GFGGRGcap BACKBONE 3 C O
GFGGRGcap BACKBONE 4 C O
GFGGRGcap BACKBONE 5 C O
GFGGRGcap BACKBONE 6 C O
GFGGRGcap BACKBONE 7 C O
GFGGRGcap CATIONPI 3 6
GFGGRGcap TOTALATOMS 84
EOF
cat << EOF > peptidename_grggfg_cap
GRGGFGcap
EOF
cat << EOF > input_order_parameter_grggfg_cap
GRGGFGcap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
GRGGFGcap BACKBONE 2 C O
GRGGFGcap BACKBONE 3 C O
GRGGFGcap BACKBONE 4 C O
GRGGFGcap BACKBONE 5 C O
GRGGFGcap BACKBONE 6 C O
GRGGFGcap BACKBONE 7 C O
GRGGFGcap CATIONPI 6 3
GRGGFGcap TOTALATOMS 84
EOF
cat << EOF > peptidename_gkggfg_cap
GKGGFGcap
EOF
cat << EOF > input_order_parameter_gkggfg_cap
GKGGFGcap PLANERESIDUE 6 CG CD1 CE1 CZ CE2 CD2
GKGGFGcap BACKBONE 2 C O
GKGGFGcap BACKBONE 3 C O
GKGGFGcap BACKBONE 4 C O
GKGGFGcap BACKBONE 5 C O
GKGGFGcap BACKBONE 6 C O
GKGGFGcap BACKBONE 7 C O
GKGGFGcap CATIONPI 6 3
GKGGFGcap TOTALATOMS 82
EOF
cat << EOF > peptidename_gfggkg_cap
GFGGKGcap
EOF
cat << EOF > input_order_parameter_gfggkg_cap
GFGGKGcap PLANERESIDUE 3 CG CD1 CE1 CZ CE2 CD2
GFGGKGcap BACKBONE 2 C O
GFGGKGcap BACKBONE 3 C O
GFGGKGcap BACKBONE 4 C O
GFGGKGcap BACKBONE 5 C O
GFGGKGcap BACKBONE 6 C O
GFGGKGcap BACKBONE 7 C O
GFGGKGcap CATIONPI 3 6
GFGGKGcap TOTALATOMS 82
EOF
if [[ $1 == "yyggyy_99idps_nocap" ]]
then
    cp peptidename_yyggyy_nocap peptidename
    cp input_order_parameter_yyggyy_nocap input_order_parameter
elif [[ $1 == "ffggff_99idps_nocap" ]]
then
    cp peptidename_ffggff_nocap peptidename
    cp input_order_parameter_ffggff_nocap input_order_parameter
elif [[ $1 == "yrggry_99idps_nocap" ]]
then
    cp peptidename_yrggry_nocap peptidename
    cp input_order_parameter_yrggry_nocap input_order_parameter
elif [[ $1 == "ryggyr_99idps_nocap" ]]
then
    cp peptidename_ryggyr_nocap peptidename
    cp input_order_parameter_ryggyr_nocap input_order_parameter
elif [[ $1 == "ykggky_99idps_nocap" ]]
then
    cp peptidename_ykggky_nocap peptidename
    cp input_order_parameter_ykggky_nocap input_order_parameter
elif [[ $1 == "kyggyk_99idps_nocap" ]]
then
    cp peptidename_kyggyk_nocap peptidename
    cp input_order_parameter_kyggyk_nocap input_order_parameter
elif [[ $1 == "dimerYYGGYYnocap" ]]
then
    cp peptidename_dimeryyggyy_nocap peptidename
    cp input_order_parameter_dimeryyggyy_nocap input_order_parameter
elif [[ $1 == "yyggyy_99idps_cap" ]]
then
    cp peptidename_yyggyy_cap peptidename
    cp input_order_parameter_yyggyy_cap input_order_parameter
elif [[ $1 == "ffggff_99idps_cap" ]]
then
    cp peptidename_ffggff_cap peptidename
    cp input_order_parameter_ffggff_cap input_order_parameter
elif [[ $1 == "yrggry_99idps_cap" ]]
then
    cp peptidename_yrggry_cap peptidename
    cp input_order_parameter_yrggry_cap input_order_parameter
elif [[ $1 == "ryggyr_99idps_cap" ]]
then
    cp peptidename_ryggyr_cap peptidename
    cp input_order_parameter_ryggyr_cap input_order_parameter
elif [[ $1 == "ykggky_99idps_cap" ]]
then
    cp peptidename_ykggky_cap peptidename
    cp input_order_parameter_ykggky_cap input_order_parameter
elif [[ $1 == "kyggyk_99idps_cap" ]]
then
    cp peptidename_kyggyk_cap peptidename
    cp input_order_parameter_kyggyk_cap input_order_parameter
elif [[ $1 == "yggggy_99idps_cap" ]]
then
    cp peptidename_yggggy_cap peptidename
    cp input_order_parameter_yggggy_cap input_order_parameter
elif [[ $1 == "fggggf_99idps_cap" ]]
then
    cp peptidename_fggggf_cap peptidename
    cp input_order_parameter_fggggf_cap input_order_parameter
elif [[ $1 == "yggggf_99idps_cap" ]]
then
    cp peptidename_yggggf_cap peptidename
    cp input_order_parameter_yggggf_cap input_order_parameter
elif [[ $1 == "fggggy_99idps_cap" ]]
then
    cp peptidename_fggggy_cap peptidename
    cp input_order_parameter_fggggy_cap input_order_parameter
elif [[ $1 == "yggggr_99idps_cap" ]]
then
    cp peptidename_yggggr_cap peptidename
    cp input_order_parameter_yggggr_cap input_order_parameter
elif [[ $1 == "rggggy_99idps_cap" ]]
then
    cp peptidename_rggggy_cap peptidename
    cp input_order_parameter_rggggy_cap input_order_parameter
elif [[ $1 == "yggggk_99idps_cap" ]]
then
    cp peptidename_yggggk_cap peptidename
    cp input_order_parameter_yggggk_cap input_order_parameter
elif [[ $1 == "kggggy_99idps_cap" ]]
then
    cp peptidename_kggggy_cap peptidename
    cp input_order_parameter_kggggy_cap input_order_parameter
elif [[ $1 == "fggggr_99idps_cap" ]]
then
    cp peptidename_fggggr_cap peptidename
    cp input_order_parameter_fggggr_cap input_order_parameter
elif [[ $1 == "rggggf_99idps_cap" ]]
then
    cp peptidename_rggggf_cap peptidename
    cp input_order_parameter_rggggf_cap input_order_parameter
elif [[ $1 == "fggggk_99idps_cap" ]]
then
    cp peptidename_fggggk_cap peptidename
    cp input_order_parameter_fggggk_cap input_order_parameter
elif [[ $1 == "kggggf_99idps_cap" ]]
then
    cp peptidename_kggggf_cap peptidename
    cp input_order_parameter_kggggf_cap input_order_parameter
elif [[ $1 == "gyggyg_99idps_cap" ]]
then
    cp peptidename_gyggyg_cap peptidename
    cp input_order_parameter_gyggyg_cap input_order_parameter
elif [[ $1 == "gfggfg_99idps_cap" ]]
then
    cp peptidename_gfggfg_cap peptidename
    cp input_order_parameter_gfggfg_cap input_order_parameter
elif [[ $1 == "gyggfg_99idps_cap" ]]
then
    cp peptidename_gyggfg_cap peptidename
    cp input_order_parameter_gyggfg_cap input_order_parameter
elif [[ $1 == "gfggyg_99idps_cap" ]]
then
    cp peptidename_gfggyg_cap peptidename
    cp input_order_parameter_gfggyg_cap input_order_parameter
elif [[ $1 == "gyggrg_99idps_cap" ]]
then
    cp peptidename_gyggrg_cap peptidename
    cp input_order_parameter_gyggrg_cap input_order_parameter
elif [[ $1 == "grggyg_99idps_cap" ]]
then
    cp peptidename_grggyg_cap peptidename
    cp input_order_parameter_grggyg_cap input_order_parameter
elif [[ $1 == "gyggkg_99idps_cap" ]]
then
    cp peptidename_gyggkg_cap peptidename
    cp input_order_parameter_gyggkg_cap input_order_parameter
elif [[ $1 == "gkggyg_99idps_cap" ]]
then
    cp peptidename_gkggyg_cap peptidename
    cp input_order_parameter_gkggyg_cap input_order_parameter
elif [[ $1 == "gfggrg_99idps_cap" ]]
then
    cp peptidename_gfggrg_cap peptidename
    cp input_order_parameter_gfggrg_cap input_order_parameter
elif [[ $1 == "grggfg_99idps_cap" ]]
then
    cp peptidename_grggfg_cap peptidename
    cp input_order_parameter_grggfg_cap input_order_parameter
elif [[ $1 == "gfggkg_99idps_cap" ]]
then
    cp peptidename_gfggkg_cap peptidename
    cp input_order_parameter_gfggkg_cap input_order_parameter
elif [[ $1 == "gkggfg_99idps_cap" ]]
then
    cp peptidename_gkggfg_cap peptidename
    cp input_order_parameter_gkggfg_cap input_order_parameter
else
    echo "Only the following arguments are permitted"
    echo "dimerYYGGYYnocap"
    echo "yyggyy_99idps_nocap"
    echo "ffggff_99idps_nocap"
    echo "ryggyr_99idps_nocap"
    echo "yrggry_99idps_nocap"
    echo "kyggyk_99idps_nocap"
    echo "ykggky_99idps_nocap"
    echo "yyggyy_99idps_cap"
    echo "ffggff_99idps_cap"
    echo "ryggyr_99idps_cap"
    echo "yrggry_99idps_cap"
    echo "kyggyk_99idps_cap"
    echo "ykggky_99idps_cap"
    echo "yggggy_99idps_cap"
    echo "fggggf_99idps_cap"
    echo "yggggf_99idps_cap"
    echo "fggggy_99idps_cap"
    echo "rggggy_99idps_cap"
    echo "yggggr_99idps_cap"
    echo "kggggy_99idps_cap"
    echo "yggggk_99idps_cap"
    echo "rggggf_99idps_cap"
    echo "fggggr_99idps_cap"
    echo "kggggf_99idps_cap"
    echo "gfggkg_99idps_cap"
    echo "gyggyg_99idps_cap"
    echo "gfggfg_99idps_cap"
    echo "gyggfg_99idps_cap"
    echo "gfggyg_99idps_cap"
    echo "grggyg_99idps_cap"
    echo "gyggrg_99idps_cap"
    echo "gkggyg_99idps_cap"
    echo "gyggkg_99idps_cap"
    echo "grggfg_99idps_cap"
    echo "gfggrg_99idps_cap"
    echo "gkggfg_99idps_cap"
    echo "gfggkg_99idps_cap"
fi

rm peptidename_yyggyy_nocap
rm input_order_parameter_yyggyy_nocap
rm peptidename_ffggff_nocap
rm input_order_parameter_ffggff_nocap
rm peptidename_yrggry_nocap
rm input_order_parameter_yrggry_nocap
rm peptidename_ryggyr_nocap
rm input_order_parameter_ryggyr_nocap
rm peptidename_ykggky_nocap
rm input_order_parameter_ykggky_nocap
rm peptidename_kyggyk_nocap
rm input_order_parameter_kyggyk_nocap
rm peptidename_yyggyy_cap
rm input_order_parameter_yyggyy_cap
rm peptidename_ffggff_cap
rm input_order_parameter_ffggff_cap
rm peptidename_yrggry_cap
rm input_order_parameter_yrggry_cap
rm peptidename_ryggyr_cap
rm input_order_parameter_ryggyr_cap
rm peptidename_ykggky_cap
rm input_order_parameter_ykggky_cap
rm peptidename_kyggyk_cap
rm input_order_parameter_kyggyk_cap
rm peptidename_yggggy_cap
rm peptidename_fggggf_cap
rm peptidename_yggggf_cap
rm peptidename_fggggy_cap
rm peptidename_yggggr_cap
rm peptidename_rggggy_cap
rm peptidename_yggggk_cap
rm peptidename_kggggy_cap
rm peptidename_fggggr_cap
rm peptidename_rggggf_cap
rm peptidename_fggggk_cap
rm peptidename_kggggf_cap
rm peptidename_gyggyg_cap
rm peptidename_gfggfg_cap
rm peptidename_gyggfg_cap
rm peptidename_gfggyg_cap
rm peptidename_gyggrg_cap
rm peptidename_grggyg_cap
rm peptidename_gyggkg_cap
rm peptidename_gkggyg_cap
rm peptidename_gfggrg_cap
rm peptidename_grggfg_cap
rm peptidename_gfggkg_cap
rm peptidename_gkggfg_cap
rm input_order_parameter_yggggy_cap
rm input_order_parameter_fggggf_cap
rm input_order_parameter_yggggf_cap
rm input_order_parameter_fggggy_cap
rm input_order_parameter_yggggr_cap
rm input_order_parameter_rggggy_cap
rm input_order_parameter_yggggk_cap
rm input_order_parameter_kggggy_cap
rm input_order_parameter_fggggr_cap
rm input_order_parameter_rggggf_cap
rm input_order_parameter_fggggk_cap
rm input_order_parameter_kggggf_cap
rm input_order_parameter_gyggyg_cap
rm input_order_parameter_gfggfg_cap
rm input_order_parameter_gyggfg_cap
rm input_order_parameter_gfggyg_cap
rm input_order_parameter_gyggrg_cap
rm input_order_parameter_grggyg_cap
rm input_order_parameter_gyggkg_cap
rm input_order_parameter_gkggyg_cap
rm input_order_parameter_gfggrg_cap
rm input_order_parameter_grggfg_cap
rm input_order_parameter_gfggkg_cap
rm input_order_parameter_gkggfg_cap
