#!/bin/bash
  

# Define the base directory for the original .tpr files
base_tpr_dir="/path/to/input/system/folder" 

# Loop over folder numbers from 1 to 5
for i in {1..5}; do
    folder="replicate${i}"
    output_file="trajout_replicate${i}.xtc"
    
    # Create a list of input trajectories, starting with the main file
    input_fibnz="${folder}/replicate${i}.xtc"
    for part in $(ls ${folder}/replicate${i}.part*.xtc); do
        input_fibnz+=" ${part}"
    done

    # Define the path to the 50ns.tpr file
    tpr_file="${base_tpr_dir}/${folder}/${folder}.tpr"
    ref_file="${base_tpr_dir}/${folder}/step5_input*"
    
    cat <<EOT > "${folder}/concat_${i}.sh"
#!/bin/bash

# module load gromacs


# Set the path to gmx
GMX_PATH="/path/to/gmx_mpi"


# Get the current path
current_path=\$(pwd)
\${GMX_PATH} trjcat -f \${current_path}/${input_fibnz} -o \${current_path}/${folder}/${output_file}


# # Copy the replicate{i}.tpr file to the analysis folder
cp ${tpr_file} \${current_path}/${folder}/
cp ${ref_file} \${current_path}/${folder}/

EOT

    # Make the concat_ript executable
    chmod +x "${folder}/concat_${i}.sh"
done
