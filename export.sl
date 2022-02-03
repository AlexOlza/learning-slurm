#!/bin/bash

#SBATCH--time=00:10:00
#SBATCH--job-name="exp"
#SBATCH--partition="short"

echo "-------" 
echo "Copying input files to temporary run dir" 
cp *.py -v $SCRATCH_JOB

cd $SCRATCH_JOB
echo "-------" 
echo "START python" 
date +"%F %T" 
module load Python/3.8.6-GCCcore-10.2.0


srun python $ALGORITHM.py $ALGORITHM $EXPERIMENT
sleep 2
echo "-------" 
echo "Copying output files to home folder" 
date +"%F %T" 

cp -r $SCRATCH_JOB  /home/aolza/$SLURM_JOB_ID
chmod -R 770 /home/aolza/$SLURM_JOB_ID

exit 0
