#!/bin/bash
#SBATCH -J train_ivae_mobile                    # Job name
#SBATCH --account=gts-rs275                     # charge account
#SBATCH -N 1 --ntasks-per-node=1                # Number of nodes and cores per node required
#SBATCH --mem-per-cpu=10G                       # Memory per core
#SBATCH -t 60                                   # Duration of the job (Ex: 15 mins)
#SBATCH -q inferno                              # QOS Name
#SBATCH -o Report-%j.out                        # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL              # Mail preferences
#SBATCH --mail-user=cchen847@gatech.edu         # E-mail address for notifications
cd $SLURM_SUBMIT_DIR                            # Change to working directory

module add nvidia/9.0

source ~/.bashrc
conda activate deep
pyhton main.py -f   -c 1 -p 1
