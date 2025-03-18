#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import os


# In[ ]:


# List of directories to create
directories = [
    'img_ana/rmsd',
    'img_ana/tm_rmsd'
]

# Create directories (with parents if needed)
for dir_path in directories:
    os.makedirs(dir_path, exist_ok=True)
    print(f"Created directory: {dir_path}")


# In[ ]:


def read_xvg(filename):
    data = np.genfromtxt([i for i in open(filename).read().splitlines() 
        if not i.startswith(('#','@'))])
    return data


# In[ ]:


def single_plot_xvg(inp1, inp2, inp3, inp4, inp5, title_t, sup_tit, out, x_limit, y_limit):
    # Read data from XVG files
    data_rep1 = read_xvg(inp1)
    data_rep2 = read_xvg(inp2)
    data_rep3 = read_xvg(inp3)
    data_rep4 = read_xvg(inp4)
    data_rep5 = read_xvg(inp5)

    fig, ax = plt.subplots(figsize=(10, 6))  # Single plot

    # Set font properties
    font = {'family': 'sans-serif',
            'weight': 'bold',
            'size': 10}
    plt.rc('font', **font)

    # Define axis limits
    # x_limit = (0, 1000)

    # Plot data for each replicate
    ax.plot(data_rep1[:, 0], data_rep1[:, 1], color='red', label=title_t+' rep1')
    ax.plot(data_rep2[:, 0], data_rep2[:, 1], color='blue', label=title_t+' rep2')
    ax.plot(data_rep3[:, 0], data_rep3[:, 1], color='green', label=title_t+' rep3')
    ax.plot(data_rep4[:, 0], data_rep4[:, 1], color='black', label=title_t+' rep4')
    ax.plot(data_rep5[:, 0], data_rep5[:, 1], color='cyan', label=title_t+' rep5')

    # Set axis labels
    ax.set_xlabel('Time (ns)', fontsize=10, fontweight='bold')
    ax.set_ylabel('RMSD (nm)', fontsize=10, fontweight='bold')

    # Set axis limits
    ax.set_xlim(x_limit)
    ax.set_ylim(y_limit)

    # Set title and legend
    ax.set_title(sup_tit, fontsize=10, fontweight='bold')
    ax.legend(fontsize=8)

    # Adjust layout
    plt.tight_layout()

    # Save and show the plot
    plt.savefig(out+".png", bbox_inches='tight')
    # plt.savefig(out+".svg", bbox_inches='tight')
    plt.show()


# In[ ]:


whole_protein_rmsd = ['sim_ana/rmsd/pro_BB_rmsd_rep1.xvg', 
                   'sim_ana/rmsd/pro_BB_rmsd_rep2.xvg', 
                   'sim_ana/rmsd/pro_BB_rmsd_rep3.xvg', 
                   'sim_ana/rmsd/pro_BB_rmsd_rep4.xvg', 
                   'sim_ana/rmsd/pro_BB_rmsd_rep5.xvg']
whole_protein_rmsd[0]


# In[ ]:


single_plot_xvg(whole_protein_rmsd[0], whole_protein_rmsd[1], whole_protein_rmsd[2], whole_protein_rmsd[3], whole_protein_rmsd[4],  
         "whole protein", "RMSD of whole protein\n backbone atoms", 
         "img_ana/rmsd/all_rep_together_rmsd_whole_protein", (0, 200), (0, 2))


# In[ ]:


tm_protein_rmsd = ['sim_ana/rmsd/tm_BB_rmsd_rep1.xvg', 
                'sim_ana/rmsd/tm_BB_rmsd_rep2.xvg', 
                'sim_ana/rmsd/tm_BB_rmsd_rep3.xvg',
                'sim_ana/rmsd/tm_BB_rmsd_rep4.xvg',
                'sim_ana/rmsd/tm_BB_rmsd_rep5.xvg']
tm_protein_rmsd[0]


# In[ ]:


single_plot_xvg(tm_protein_rmsd[0], tm_protein_rmsd[1], tm_protein_rmsd[2], tm_protein_rmsd[3], tm_protein_rmsd[4],  
         "TM protein", "RMSD of TM protein\n backbone atom", 
         "img_ana/rmsd/all_rep_together_rmsd_tm_protein", (0, 200), (0, 0.5))


# In[ ]:


ligand_rmsd = ['sim_ana/rmsd/ligand_rmsd_rep1.xvg', 
                   'sim_ana/rmsd/ligand_rmsd_rep2.xvg', 
                   'sim_ana/rmsd/ligand_rmsd_rep3.xvg', 
                   'sim_ana/rmsd/ligand_rmsd_rep4.xvg', 
                   'sim_ana/rmsd/ligand_rmsd_rep5.xvg']

ligand_rmsd[1]


# In[ ]:


single_plot_xvg(ligand_rmsd[0], ligand_rmsd[1], ligand_rmsd[2], ligand_rmsd[3], ligand_rmsd[4],  
         "ligand protein", "RMSD of ligand \n protein-ligand system", 
          "img_ana/rmsd/all_rep_together_rmsd_ligand", (0, 200), (0, 1))


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:


def plot_xvg(inp1, inp2, inp3, inp4, inp5, title_t, sup_tit, out, x_limit, y_limit):
    # Read data from XVG files
    data_rep1 = read_xvg(inp1)
    data_rep2 = read_xvg(inp2)
    data_rep3 = read_xvg(inp3)
    data_rep4 = read_xvg(inp4)
    data_rep5 = read_xvg(inp5)


    fig, axs = plt.subplots(5, 1, figsize=(10, 15))  # 1 row, 7 columns

    # Set font properties
    font = {'family': 'sans-serif',
            'weight': 'bold',
            'size': 10}
    plt.rc('font', **font)

    # Define axis limits
#     x_limit = (0, 1000)

    # Plot data for each replicate
    axs[0].plot(data_rep1[:, 0], data_rep1[:, 1], color='red')
    axs[0].set_title(title_t+' rep1', fontweight='bold', fontsize=10)
    axs[0].tick_params(axis='both', which='major', labelsize=10)
    axs[0].set_xlim(x_limit)
    axs[0].set_ylim(y_limit)

    axs[1].plot(data_rep2[:, 0], data_rep2[:, 1], color='blue')
    axs[1].set_title(title_t+' rep2', fontweight='bold', fontsize=10)
    axs[1].tick_params(axis='both', which='major', labelsize=10)
    axs[1].set_xlim(x_limit)
    axs[1].set_ylim(y_limit)

    axs[2].plot(data_rep3[:, 0], data_rep3[:, 1], color='green')
    axs[2].set_title(title_t+' rep3', fontweight='bold', fontsize=10)
    axs[2].tick_params(axis='both', which='major', labelsize=10)
    axs[2].set_xlim(x_limit)
    axs[2].set_ylim(y_limit)

    axs[3].plot(data_rep4[:, 0], data_rep4[:, 1], color='black')
    axs[3].set_title(title_t+' rep4', fontweight='bold', fontsize=10)
    axs[3].tick_params(axis='both', which='major', labelsize=10)
    axs[3].set_xlim(x_limit)
    axs[3].set_ylim(y_limit)

    axs[4].plot(data_rep5[:, 0], data_rep5[:, 1], color='cyan')
    axs[4].set_title(title_t+' rep5', fontweight='bold', fontsize=10)
    axs[4].tick_params(axis='both', which='major', labelsize=10)
    axs[4].set_xlim(x_limit)
    axs[4].set_ylim(y_limit)

    # Set common labels
    fig.text(0.5, 0.04, 'Time (ns)', ha='center', fontsize=10, fontweight='bold')
    fig.text(0.04, 0.5, 'RMSD (nm)', va='center', rotation='vertical', fontsize=10, fontweight='bold')

    # Set suptitle
    fig.suptitle(sup_tit, fontsize=10, fontweight='bold')

    # Adjust layout
    plt.tight_layout(rect=[0.04, 0.04, 1, 0.96])

    # Save and show the plot
    plt.savefig(out+".png", bbox_inches='tight')
    # plt.savefig(out+".svg", bbox_inches='tight')
    plt.show()


# In[ ]:





# In[ ]:


plot_xvg(whole_protein_rmsd[0], whole_protein_rmsd[1], whole_protein_rmsd[2], whole_protein_rmsd[3], whole_protein_rmsd[4],  
         "whole protein", "RMSD of whole protein\n backbone atom", 
          "img_ana/rmsd/indv_rep_together_rmsd_whole_protein", (0, 200), (0, 2))


# In[ ]:


plot_xvg(tm_protein_rmsd[0], tm_protein_rmsd[1], tm_protein_rmsd[2], tm_protein_rmsd[3], tm_protein_rmsd[4],  
         "TM protein", "RMSD of TM protein\n backbone atom", 
          "img_ana/rmsd/indv_rep_together_rmsd_tm", (0, 200), (0, 0.5))


# In[ ]:


plot_xvg(ligand_rmsd[0], ligand_rmsd[1], ligand_rmsd[2], ligand_rmsd[3], ligand_rmsd[4],  
         "ligand protein", "RMSD of ligand protein\n protein-ligand system", 
          "img_ana/rmsd/indv_rep_together_rmsd_ligand", (0, 200), (0, 1))


# In[ ]:





# In[ ]:


tm11_protein_rmsd = ['sim_ana/tm_rmsd/TM11_rmsd_rep1.xvg', 
                'sim_ana/tm_rmsd/TM11_rmsd_rep2.xvg', 
                'sim_ana/tm_rmsd/TM11_rmsd_rep3.xvg',
                'sim_ana/tm_rmsd/TM11_rmsd_rep4.xvg',
                'sim_ana/tm_rmsd/TM11_rmsd_rep5.xvg']
tm11_protein_rmsd[0]


# In[ ]:


plot_xvg(tm11_protein_rmsd[0], tm11_protein_rmsd[1], tm11_protein_rmsd[2], tm11_protein_rmsd[3], tm11_protein_rmsd[4],  
         "TM11 protein", "RMSD of TM11 protein\n backbone atom", 
         "img_ana/tm_rmsd/indv_rep_together_rmsd_tm11", (0, 200), (0, 0.5))


# In[ ]:


single_plot_xvg(tm11_protein_rmsd[0], tm11_protein_rmsd[1], tm11_protein_rmsd[2], tm11_protein_rmsd[3], tm11_protein_rmsd[4],  
         "TM11 protein", "RMSD of TM11 protein\n backbone atom", 
          "img_ana/tm_rmsd/all_rep_together_rmsd_tm11", (0, 200), (0, 0.5))


# In[ ]:




