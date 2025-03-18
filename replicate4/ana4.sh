#!/bin/bash

# Load required modules (uncomment if needed)
# module load gromacs

# Set GROMACS executable path (update if needed)
GMX_PATH="/path/to/gmx_mpi"

# Get current working directory
current_path=$(pwd)

# Input files
tpr_file="${current_path}/replicate4/replicate4.tpr"
index_file="${current_path}/index_replicate.ndx"  # System-specific index file

# ========================
#  Trajectory Processing
# ========================
# Remove periodic boundary conditions and center
echo "Processing trajectory: PBC removal and alignment"
echo 1 0 | gmx trjconv -f ${current_path}/replicate4/trajout*xtc -s ${tpr_file} -n ${index_file} \
  -pbc mol -ur compact -center -o ${current_path}/replicate4/no_pbc_replicate4.xtc 

# Align to transmembrane (TM) helices backbone
echo 31 0 | gmx trjconv -f ${current_path}/replicate4/no_pbc_replicate4.xtc -s ${tpr_file} \
  -n ${index_file} -fit rot+trans -o ${current_path}/replicate4/tm_aligned_no_pbc_replicate4.xtc

# Cleanup intermediate files
rm ${current_path}/replicate4/no_pbc_replicate4.xtc 

# # ========================
# #  RMSD Calculations
# # ========================
# # Backbone RMSDs (whole protein and TM regions)
# echo "Calculating RMSD metrics"
# echo 31 4 | gmx rms -tu ns -f ${current_path}/replicate4/tm_aligned_no_pbc_replicate4.xtc \
#   -s ${current_path}/replicate4/step5_input.pdb -o ${current_path}/sim_ana/rmsd/pro_BB_rmsd_rep4.xvg -n ${index_file}

# echo 31 31 | gmx rms -tu ns -f ${current_path}/replicate4/tm_aligned_no_pbc_replicate4.xtc \
#   -s ${current_path}/replicate4/step5_input.pdb -o ${current_path}/sim_ana/rmsd/tm_BB_rmsd_rep4.xvg -n ${index_file}

# echo 31 13 | gmx rms -tu ns -f ${current_path}/replicate4/tm_aligned_no_pbc_replicate4.xtc \
#   -s ${current_path}/replicate4/step5_input.pdb -o ${current_path}/sim_ana/rmsd/ligand_rmsd_rep4.xvg -n ${index_file}

# # ========================
# #  RMSF Calculations
# # ========================
# echo "Calculating RMSF metrics"
# echo 1 | gmx rmsf -f ${current_path}/replicate4/tm_aligned_no_pbc_replicate4.xtc \
#   -s ${current_path}/replicate4/step5_input.pdb -fit -res -o ${current_path}/sim_ana/rmsf/oct2_BB_rmsf_rep4.xvg \
#   -n ${index_file} -ox ${current_path}/sim_ana/rmsf/avg_str_oct2_rep4.pdb

echo 13 | gmx rmsf -f ${current_path}/replicate4/tm_aligned_no_pbc_replicate4.xtc \
  -s ${current_path}/replicate4/step5_input.pdb -fit -o ${current_path}/sim_ana/rmsf/ligand_rmsf_rep4.xvg \
  -n ${index_file}

# # ========================
# #  Solvent Accessible Surface Area
# # ========================
# echo "Calculating SASA metrics"
# gmx sasa -tu ns -f ${current_path}/replicate4/tm_aligned_no_pbc_*xtc -s ${tpr_file} \
#   -o ${current_path}/sim_ana/sasa/tm_sasa_rep4.xvg \
#   -tv ${current_path}/sim_ana/sasa/tm_volume_rep4.xvg \
#   -n ${index_file} -surface TM_all -output TM_all

# # ========================
# #  Transmembrane Helix RMSDs
# # ========================
# echo "Calculating individual TM helix RMSDs"
# for tm in {1..12}; do
#   group=$((17 + tm))  # Calculate index group (18-29)
#   echo 31 ${group} | gmx rms -tu ns \
#     -f ${current_path}/replicate4/tm_aligned_no_pbc_replicate4.xtc \
#     -s ${current_path}/replicate4/step5_input.pdb \
#     -o ${current_path}/sim_ana/tm_rmsd/TM${tm}_rmsd_rep4.xvg -n ${index_file}
# done

# # ========================
# #  Minimum Distance Calculations
# # ========================
# echo "Calculating minimum distances"
# echo 32 33 | gmx mindist -tu ns \
#   -f ${current_path}/replicate4/tm_aligned_no_pbc_*xtc \
#   -s ${current_path}/replicate4/step5_input.pdb \
#   -od ${current_path}/sim_ana/mindist/Y37_Y362_rep4.xvg -n ${index_file}

# echo 13 32 | gmx mindist -tu ns \
#   -f ${current_path}/replicate4/tm_aligned_no_pbc_*xtc \
#   -s ${current_path}/replicate4/step5_input.pdb \
#   -od ${current_path}/sim_ana/mindist/ligand_Y37_rep4.xvg -n ${index_file}

