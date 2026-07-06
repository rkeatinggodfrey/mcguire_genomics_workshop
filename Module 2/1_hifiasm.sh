#!/bin/bash
#SBATCH --job-name=hifiasm		            # job name
#SBATCH --mail-type=END,FAIL		          # mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=yourname@ufl.edu	    # where to send mail	
#SBATCH --ntasks=1			                  # run a single task
#SBATCH --cpus-per-task=16		            # number of CPU cores per task - should match command line
#SBATCH --mem-per-cpu=8gb		              # max memory allocated to each cpu in gigabites
#SBATCH --output=hifiasm.out		          # output file name; add %j to append job num
#SBATCH --time=4-00:00:00		              # time limit in d-hh:mm:ss
#SBATCH --account=change_account		      # hipergator account
#SBATCH --qos=change_account			        # regular or -b for burst

date;hostname;pwd

# This script uses Hifiasm to create a genome assembly from Pac-Bio reads

# To run, use: sbatch [scriptname.sh] output reads
# Example:
# sbatch 1_hifiasm.sh /path/to/output/folder/Genus_species.asm /path/to/your.fastq.gz


# Getting variables from command line
output=${1}				# path to the output with extension ".asm"
reads=${2}				# path to reads in fastq.gz format

# load specific version of necessary modules
module load ufrc
module load hifiasm/0.25.0

hifiasm -o ${output} -l 3 -t 16 ${reads}


# for information about phased and primary assembly options see
# https://hifiasm.readthedocs.io/en/latest/pa-assembly.html
