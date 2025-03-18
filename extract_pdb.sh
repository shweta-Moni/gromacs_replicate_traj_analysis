#!/bin/bash

# Base paths
traj_base_path="."  # Current directory
output_base_path="./snapshot"  # Output directory in the current directory

# Loop over replicates
for rep in {1..5}; do
    traj_path="${traj_base_path}/replicate${rep}"
    output_path="${output_base_path}/replicate${rep}"
    
    # Create output directory if it doesn't exist
    mkdir -p ${output_path}
    
    # Initialize loop variables
    i=0
    j=0
    while [ $j -le 1000000 ]; do
        # Extract PDB at every 100000 ps, using the index file as well 
        # echo 1 : Protein group in the index file
        echo 1 | gmx_mpi trjconv -f ${traj_path}/tm_aligned_no_pbc*${rep}.xtc \
                              -s ${traj_path}/replicate${rep}.tpr \
                              -n index*.ndx \
                              -dump $j \
                              -o ${output_path}/replicate${rep}_${i}-ns.pdb
        
        # Update time and index
        j=$(( j + 100000 )) # increase time by 100000 ps
        i=$(( i + 100 ))    # increase index for output files
    done
done