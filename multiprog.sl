#!/bin/bash
#SBATCH--time=00:30:00
#SBATCH--job-name="sim_steps"
#SBATCH --mem-per-cpu=1G
#SBATCH--partition="short"
#SBATCH--ntasks=3
#SBATCH--output=/home/aolza/Desktop/learning-slurm/output/omultiprog.txt
#SBATCH--error=/home/aolza/Desktop/learning-slurm/output/emultiprog.txt
echo "Run 3 different python scripts, each with arguments, using srun --multi-prog ... &"
echo "-------" 
echo "Copying input files to temporary run dir" 
cp * -v $SCRATCH_JOB

cd $SCRATCH_JOB
echo "-------" 
echo "START python" 
date +"%F %T" 
module load Python/3.8.6-GCCcore-10.2.0

date +"%F %T"
srun -n3 -l --multi-prog multiprog.conf
echo "multi-prog ended"
wait

sleep 2
echo "-------" 
echo "Copying output files to home folder" 
date +"%F %T" 

