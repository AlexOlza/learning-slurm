#!/bin/bash

sbatch <<EOT
#!/bin/bash
#SBATCH--time=00:10:00
#SBATCH--job-name="test"
#SBATCH --mem-per-cpu=1G
#SBATCH--partition="short"
#SBATCH--output="/home/aolza/Desktop/learning-slurm/output/o"$1".txt"
#SBATCH--error="/home/aolza/Desktop/learning-slurm/output/e"$1".txt"
echo "-------"
echo "Copying input files to temporary run dir"
echo "Scratch "$SCRATCH_JOB
cp test1.py -v $SCRATCH_JOB

cd $SCRATCH_JOB
echo "-------" 
echo "START python" 
date +"%F %T" 
module load Python/3.8.6-GCCcore-10.2.0


srun python $1.py $1 $2
sleep 2
echo "-------" 
echo "Copying output files to home folder" 
date +"%F %T" 

exit 0
EOT

########################
#	USAGE	########
#1) DEFINE ENVIRONMENT VARIABLES out AND err
#sbatch --output=$out --error=$err --export=ALL,ALGORITHM=$ALGORITHM,EXPERIMENT=$EXPERIMENT export.sl 
#
#############################
