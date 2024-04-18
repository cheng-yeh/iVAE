#!/bin/bash
#SBATCH -J train_ivae_mobile                    # Job name
#SBATCH --account=gts-rs275                     # charge account
#SBATCH -N 1 --gres=gpu:RTX_6000:1              # Number of nodes and cores per node required
#SBATCH --mem-per-gpu=12G                       # Memory per core
#SBATCH -t 60                                   # Duration of the job (Ex: 15 mins)
#SBATCH -q inferno                              # QOS Name
#SBATCH -o Report-%j.out                        # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL              # Mail preferences
#SBATCH --mail-user=cchen847@gatech.edu         # E-mail address for notifications
cd $SLURM_SUBMIT_DIR                            # Change to working directory

module load anaconda3/2022.05                   # Load module dependencies
conda create -n ivae python=3.8 -y
conda activate ivae
conda install pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.3 -c pytorch
pip install tensorboardX scipy 
python main.py -f ./data/scalp_data.npz --cuda --preload-gpu --epochs 200 --batch-size 64
