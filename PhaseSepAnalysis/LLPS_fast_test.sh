#!/bin/bash
# run 1input_generate.sh separately and run it only once
cat << EOF > sbatch_dummy
#!/bin/bash
#SBATCH -p MAIN
#SBATCH --job-name=dummy
#SBATCH -n1 -N1
##SBATCH --mail-type=FAIL # Receive an email if your job fails

module purge # unload all modules from user's environment.
module load gcc/7.5.0
module load anaconda/python3/2021.11


# srun ./3initial_cv.sh dummy full_cv
# srun ./4peak_analysis.sh dummy full_cv
# DO NOT RUN INFLECTION ANALYSIS FOR ALL INFLECTION POINTS
# FIRST MAKE A FILE CONTAINING INFLECTION POINTS OF INTEREST
# srun ./5inflection_analysis.sh dummy full_cv

# THIS ANALYSIS IS FOR NEXT PROJECT
# srun ./2energy_decomposition.sh dummy
# srun ./3initial_cv.sh dummy bade
# srun ./4peak_analysis.sh dummy bade
# srun ./5inflection_analysis.sh dummy bade 
# srun ./3initial_cv.sh dummy badv
# srun ./4peak_analysis.sh dummy badv
# srun ./5inflection_analysis.sh dummy badv 

# Run this one at a time
# srun ./7extract_str_pdb.sh dummy
# srun ./8general_orderparam_input.sh dummy
# srun ./91peptide_specific_orderparam_input.sh dummy
# srun ./92does_prelim_input_exist.sh dummy
# srun ./6cleanup.sh
# srun ./rough_disconn.sh dummy
# srun ./getmin.sh dummy
# srun ./dijkstra_extractmin.sh dummy
# srun ./shannon_frustration.sh dummy
# srun ./data_gen_edecomp_ediff.sh dummy edecompdiffpeak
EOF
# concept peptides GXGGXG 
for i in \
    gfggfg_99idps_cap \
    gyggyg_99idps_cap \
    gfggyg_99idps_cap \
    gyggfg_99idps_cap \
    grggyg_99idps_cap \
    gkggyg_99idps_cap \
    gyggrg_99idps_cap \
    gyggkg_99idps_cap \
    grggfg_99idps_cap \
    gkggfg_99idps_cap \
    gfggrg_99idps_cap \
    gfggkg_99idps_cap 
do
    cp sbatch_dummy sbatch$i
    sed -i "s/dummy/$i/g" sbatch$i
    sbatch sbatch$i
done
# concept peptides XGGGGX
for i in \
    fggggf_99idps_cap \
    yggggy_99idps_cap \
    fggggy_99idps_cap \
    yggggf_99idps_cap \
    rggggy_99idps_cap \
    kggggy_99idps_cap \
    yggggr_99idps_cap \
    yggggk_99idps_cap \
    rggggf_99idps_cap \
    kggggf_99idps_cap \
    fggggr_99idps_cap \
    fggggk_99idps_cap
do
    cp sbatch_dummy sbatch$i
    sed -i "s/dummy/$i/g" sbatch$i
    sbatch sbatch$i
done
# LLPS peptide XJGGJX capped
for i in \
    ffggff_99idps_cap \
    yyggyy_99idps_cap \
    lfggfl_99idps_cap \
    flgglf_99idps_cap \
    ryggyr_99idps_cap \
    kyggyk_99idps_cap \
    yrggry_99idps_cap \
    ykggky_99idps_cap \
    regger_99idps_cap \
    keggek_99idps_cap \
    llggll_99idps_cap \
    aaggaa_99idps_cap 
do
    cp sbatch_dummy sbatch$i
    sed -i "s/dummy/$i/g" sbatch$i
    sbatch sbatch$i
done

# LLPS peptide XJGGJX uncapped
for i in \
    ffggff_99idps_nocap \
    yyggyy_99idps_nocap \
    lfggfl_99idps_nocap \
    flgglf_99idps_nocap \
    ryggyr_99idps_nocap \
    kyggyk_99idps_nocap \
    yrggry_99idps_nocap \
    ykggky_99idps_nocap \
    regger_99idps_nocap \
    keggek_99idps_nocap \
    llggll_99idps_nocap \
    aaggaa_99idps_nocap 
do
    cp sbatch_dummy sbatch$i
    sed -i "s/dummy/$i/g" sbatch$i
    sbatch sbatch$i
done
# Poly-amino acid
for i in \
    gggggg_99idps_cap \
    aaaaaa_99idps_cap \
    vvvvvv_99idps_cap \
    rrrrrr_99idps_cap \
    kkkkkk_99idps_cap \
    eeeeee_99idps_cap \
    gggggg_99idps_nocap \
    aaaaaa_99idps_nocap \
    vvvvvv_99idps_nocap \
    rrrrrr_99idps_nocap \
    kkkkkk_99idps_nocap \
    eeeeee_99idps_nocap  
do
    cp sbatch_dummy sbatch$i
    sed -i "s/dummy/$i/g" sbatch$i
    sbatch sbatch$i
done
# LLPS peptide XJGGJX capped
for i in \
    ffggff_19sb_cap \
    yyggyy_19sb_cap \
    lfggfl_19sb_cap \
    flgglf_19sb_cap \
    ryggyr_19sb_cap \
    kyggyk_19sb_cap \
    yrggry_19sb_cap \
    ykggky_19sb_cap \
    regger_19sb_cap \
    keggek_19sb_cap \
    llggll_19sb_cap \
    aaggaa_19sb_cap 
do
    cp sbatch_dummy sbatch$i
    sed -i "s/dummy/$i/g" sbatch$i
    sbatch sbatch$i
done

# LLPS peptide XJGGJX uncapped
for i in \
    ffggff_19sb_nocap \
    yyggyy_19sb_nocap \
    lfggfl_19sb_nocap \
    flgglf_19sb_nocap \
    ryggyr_19sb_nocap \
    kyggyk_19sb_nocap \
    yrggry_19sb_nocap \
    ykggky_19sb_nocap \
    regger_19sb_nocap \
    keggek_19sb_nocap \
    llggll_19sb_nocap \
    aaggaa_19sb_nocap 
do
    cp sbatch_dummy sbatch$i
    sed -i "s/dummy/$i/g" sbatch$i
    sbatch sbatch$i
done
