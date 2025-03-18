#!/bin/bash

# module load gromacs


# Set the path to gmx
GMX_PATH="/path/to/gmx_mpi"


# Get the current path
current_path=$(pwd)
# ${GMX_PATH} trjcat -f ${current_path}/replicate2/replicate2.xtc replicate2/replicate2.part0002.xtc -o ${current_path}/replicate2/trajout_replicate2.xtc

gmx trjcat -f ${current_path}/replicate2/replicate2.xtc replicate2/replicate2.part0002.xtc -o ${current_path}/replicate2/trajout_replicate2.xtc

# # Copy the *50ns.tpr file to the analysis folder
# cp /replicate2/replicate2.tpr ${current_path}/replicate2/
# cp /replicate2/step5_input* ${current_path}/replicate2/

