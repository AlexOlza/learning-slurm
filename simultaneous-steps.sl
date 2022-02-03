#!/bin/bash
#SBATCH--time=00:30:00
#SBATCH--job-name="sim_steps"
#SBATCH--mail-type=ALL 
#SBATCH--mail-user=aolza@bcamath.org
#SBATCH --mem-per-cpu=1G
#SBATCH--partition="short"
#SBATCH--output=/home/aolza/Desktop/learning-slurm/output/osim_steps.txt
#SBATCH--error=/home/aolza/Desktop/learning-slurm/output/esim_steps.txt
echo "Run 3 different python scripts, each with arguments, using srun --exclusive ... &"
echo "-------" 
echo "Copying input files to temporary run dir" 
cp test*.py -v $SCRATCH_JOB

cd $SCRATCH_JOB
echo "-------" 
echo "START python" 
date +"%F %T" 
module load Python/3.8.6-GCCcore-10.2.0

module load python-settings/0.2.2-GCCcore-10.2.0-Python-3.8.6
module load SciPy-bundle

date +"%F %T"
srun --exclusive python test1.py 1 2 3&
date +"%F %T"
srun --exclusive python test2.py a b c&
date +"%F %T"
srun --exclusive python test3.py  A B C& 
wait

sleep 2
echo "-------" 
echo "Copying output files to home folder" 
date +"%F %T" 

