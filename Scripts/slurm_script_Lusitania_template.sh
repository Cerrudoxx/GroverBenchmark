#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=NTASKS
#SBATCH --job-name=SIMULADOR_NUMCORES
#SBATCH --partition=NODO

source /lusitania_apps/anaconda/anaconda3-2023.09/anaconda_init #en el caso de Lusitania

conda activate ENTORNO

python grover_SIMULADOR_main.py RANGO_NQUBITS NUM-SHOTS

conda deactivate
