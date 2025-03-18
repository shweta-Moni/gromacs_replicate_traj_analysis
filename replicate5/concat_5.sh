#!/bin/bash

# module load gromacs


# Set the path to gmx
GMX_PATH="/path/to/gmx_mpi"


# Get the current path
current_path=$(pwd)
# ${GMX_PATH} trjcat -f ${current_path}/replicate5/replicate5.xtc replicate5/replicate5.part0002.xtc -o ${current_path}/replicate5/trajout_replicate5.xtc

gmx trjcat -f ${current_path}/replicate5/replicate5.xtc replicate5/replicate5.part0002.xtc -o ${current_path}/replicate5/trajout_replicate5.xtc

# # Copy the *50ns.tpr file to the analysis folder
# cp /replicate5/replicate5.tpr ${current_path}/replicate5/
# cp /replicate5/step5_input* ${current_path}/replicate5/

