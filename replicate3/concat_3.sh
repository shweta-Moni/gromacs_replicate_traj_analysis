#!/bin/bash

# module load gromacs


# Set the path to gmx
GMX_PATH="/path/to/gmx_mpi"


# Get the current path
current_path=$(pwd)
# ${GMX_PATH} trjcat -f ${current_path}/replicate3/replicate3.xtc replicate3/replicate3.part0002.xtc -o ${current_path}/replicate3/trajout_replicate3.xtc

gmx trjcat -f ${current_path}/replicate3/replicate3.xtc replicate3/replicate3.part0002.xtc -o ${current_path}/replicate3/trajout_replicate3.xtc

# # Copy the *50ns.tpr file to the analysis folder
# cp /replicate3/replicate3.tpr ${current_path}/replicate3/
# cp /replicate3/step5_input* ${current_path}/replicate3/

