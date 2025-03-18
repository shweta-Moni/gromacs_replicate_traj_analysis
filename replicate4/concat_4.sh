#!/bin/bash

# module load gromacs


# Set the path to gmx
GMX_PATH="/path/to/gmx_mpi"


# Get the current path
current_path=$(pwd)
# ${GMX_PATH} trjcat -f ${current_path}/replicate4/replicate4.xtc replicate4/replicate4.part0002.xtc -o ${current_path}/replicate4/trajout_replicate4.xtc

gmx trjcat -f ${current_path}/replicate4/replicate4.xtc replicate4/replicate4.part0002.xtc -o ${current_path}/replicate4/trajout_replicate4.xtc

# # Copy the *50ns.tpr file to the analysis folder
# cp /replicate4/replicate4.tpr ${current_path}/replicate4/
# cp /replicate4/step5_input* ${current_path}/replicate4/

