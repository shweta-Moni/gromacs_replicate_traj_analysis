# gromacs_replicate_traj_analysis
**Description:**   A system with 5 replicates analyzed using GROMACS. This folder contains scripts to concatenate and analyze trajectories for each replicate, followed by plotting all replicates together for comparison and visualization.

## Molecular Dynamics (MD) Trajectory Analysis Workflow

This workflow automates post-processing and analysis of MD simulations for 5 replicates (you can many multiple replicates) of a protein-ligand system (likely a membrane protein with transmembrane domains).


shwetam0302@gmail.com


Directory Structure
====================

./
├── replicate1/
│   ├── ana1.sh               # Analysis script for replicate 1
│   ├── replicate1*.xtc       # Raw trajectory files (e.g., replicate1.xtc, replicate1.part0002.xtc)
│   ├── replicate1.tpr     	  # Topology/run input file
│   ├── index.ndx	          # GROMACS index file with custom groups
│   └── sim_ana/              # Analysis output directory
│       ├── sasa/             # Solvent accessible surface area results
│       └── tm_rmsd/          # Transmembrane domain RMSD results
└── ... (replicate2-5 with similar structure)


Step 1: Generate Concatenation Scripts
============================================================
bash concat_traj.sh

About: Automatically generates trajectory concatenation scripts for each replicate system (1-5).

Key Features
Replicate-Specific Control: Creates individual concat_{i}.sh scripts in each replicate folder
Safety First: Leaves original trajectory files untouched
Customizable: Easily modify for different numbers of replicates or trajectory patterns

Output Structure
replicate1/
└── concat_1.sh
replicate2/
└── concat_2.sh
...
replicate5/
└── concat_5.sh

Usage Tips
Edit concat_traj.sh to:
Change number of replicates ({1..5} → {1..N})
Modify trajectory filename patterns (trajout*xtc)
Target specific replicates (e.g., 2 4 5 instead of all)

Step 2: Execute Concatenation & Organize Files
============================================================
Execution Options

# Default sequential processing
bash run_concat_traj.sh

# Parallel processing (requires GNU Parallel)
find . -name "concat_*.sh" | parallel -j 2

What It Does
- Concatenates Trajectories
   - Processes replicates sequentially
   - Merges split trajectory files (e.g., replicate1.xtc, replicate1.part0002.xtc) into single trajectories

- Centralizes Essential Files
 - Copies these files to each replicate folder:
   - input.pdb (initial structure)
   - input.tpr (topology/parameters)
keep only necessary files for analysis


Step 3: Generate System Index File
===================================
bash makeIndex.sh

Key Features
- Centralized Indexing: Creates index_replicate.ndx in the project root folder
- Cross-Replicate Compatibility: Shared by all replicate systems (1-5)
- Reproducible Selection: Uses EOD blocks to document atom/residue choicest for other system as well change the atom/residue index


Step 4: Generate Analysis Scripts (ana[1-5].sh)
=================================================
bash create_analysis.sh

Creates individual ana{i}.sh scripts in each replicate folder

Step 5: Run Analysis Scripts (ana[1-5].sh)
=================================================
bash run_analysis.sh

Per-replicate scripts performing:

- Trajectory Processing
   - System centering and PBC correction
   - Alignment to reference structures (TM domains)


- Quantitative Analysis
   - RMSD calculations (backbone, TM domains, ligand)
   - RMSF (residue flexibility)
   - SASA (solvent accessibility)
   - Distance measurements (key residue pairs)


Output Files
Processed Trajectories

no_pbc_*.xtc - PBC-corrected trajectory

*_aligned_no_pbc_*.xtc - Aligned trajectories

Analysis Results

*.xvg - GROMACS analysis data files (plottable with Grace/Xmgrace)

*.pdb - Representative structures (initial/final frames)

Step 6: Plot the data
=================================================
1. rmsf_all_rep_protein_ligand.ipynb  
   - Plots the Root Mean Square Fluctuation (RMSF) for protein and ligand across all replicates from gromacs output `.xvg` files.

2. rmsd_all_rep.ipynb  
   - Plot the Root Mean Square Deviation (RMSD) for all replicates from gromacs output `.xvg` files.

3. combined_all_rep_density_plot.ipynb  
   - Combines data from all replicates and plots a density distribution for the combined dataset from gromacs output `.xvg` files.

4. replicate_wise_density_plot_from_xvg.ipynb  
   - Generates density plots for each replicate individually using data from `.xvg` files.

5. mindist_plot_all_rep.ipynb  
   - Plots the minimum distance for all replicates from gromacs output `.xvg` files.

