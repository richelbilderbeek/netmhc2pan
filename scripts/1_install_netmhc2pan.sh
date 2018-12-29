#!/bin/bash
# Script to install NetMHC2pan and its dependencies
# on the Peregrine computer cluster
#SBATCH --time=1:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --job-name=install_netmhc2pan
#SBATCH --output=install_netmhc2pan.log
module load GCCcore/4.9.3 
module load XZ/5.2.2-foss-2016a
#module load R/3.3.1-foss-2016a
module load R
Rscript -e 'devtools::install_github("richelbilderbeek/netmhc2pan")'
Rscript -e 'netmhc2pan::install_netmhc2pan()'
