#!/bin/bash
#SBATCH--time=00:30:00
#SBATCH--job-name="sim_steps"
#SBATCH --mem-per-cpu=1G
#SBATCH--partition="short"
#SBATCH--output=/home/aolza/Desktop/learning-slurm/output/omultiprog.txt
#SBATCH--error=/home/aolza/Desktop/learning-slurm/output/emultiprog.txt
srun -lN1 -r 2 python test1.py 1 2 3 &
srun -lN1 -r 0 python test2.py 1 2 3 &
sleep 1
squeue -u aolza
wait
