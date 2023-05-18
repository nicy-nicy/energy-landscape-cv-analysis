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
# srun ./cv_disconn_amyloid.sh dummy
# srun ./disconn_extractmin.sh dummy
# srun ./end_to_end_dist_deltae.sh dummy
# srun ./checkmin.sh dummy

EOF
################### Amyloid
for i in \
    nfgail_99idps_cap \
    stviie_99idps_cap \
    lyqlen_99idps_cap \
    llyyte_99idps_cap \
    vqivyk_99idps_cap 
do
    cp sbatch_dummy sbatch$i
    sed -i "s/dummy/$i/g" sbatch$i
    sbatch sbatch$i
done
################### Amyloid control
for i in \
    nagail_99idps_cap \
    nlgpvl_99idps_cap \
    liagfn_99idps_cap \
    stviip_99idps_cap \
    stvvie_99idps_cap \
    spviie_99idps_cap \
    vqivek_99idps_cap \
    naevyk_99idps_cap \
    yqleny_99idps_cap \
    yyteft_99idps_cap 
do
    cp sbatch_dummy sbatch$i
    sed -i "s/dummy/$i/g" sbatch$i
    sbatch sbatch$i
done
# Amyloid
for i in \
    gaiigl_99idps_cap \
    ggvvia_99idps_cap \
    mvggvv_99idps_cap \
    gailss_99idps_cap \
    ssqvtq_99idps_cap \
    sstnvg_99idps_cap \
    snqnnf_99idps_cap \
    svsssy_99idps_cap \
    gyviik_99idps_cap \
    klvffa_99idps_cap
do
    cp sbatch_dummy sbatch$i
    sed -i "s/dummy/$i/g" sbatch$i
    sbatch sbatch$i
done
#for i in \
#    gaiigl_99idps_nocap \
#    ggvvia_99idps_nocap \
#    mvggvv_99idps_nocap \
#    gailss_99idps_nocap \
#    ssqvtq_99idps_nocap \
#    sstnvg_99idps_nocap \
#    nfgail_99idps_nocap \
#    snqnnf_99idps_nocap \
#    svsssy_99idps_nocap \
#    gyviik_99idps_nocap \
#    klvffa_99idps_nocap \
#    vqivyk_99idps_nocap 
#do
#    cp sbatch_dummy sbatch$i
#    sed -i "s/dummy/$i/g" sbatch$i
#    sbatch sbatch$i
#done
for i in \
    evdllk_99idps_cap \
    kafiiq_99idps_cap \
    kailfl_99idps_cap \
    lsfskd_99idps_cap \
    ngerie_99idps_cap
do
    cp sbatch_dummy sbatch$i
    sed -i "s/dummy/$i/g" sbatch$i
    sbatch sbatch$i
done
