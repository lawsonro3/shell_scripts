#! /bin/bash

declare -a run_dir="/scratch/mlawson/stableABLRuns/infPer_0.001m_5m_ADM_20degPitch"
#    "/projects/dirs_to_delete/windsim/mlawson/wake_steering/stableABLRuns/24HrPer_0.001m_5m"
#    "/projects/dirs_to_delete/windsim/mlawson/wake_steering/stableABLRuns/48HrPer_0.15m_5m"
#    "/projects/dirs_to_delete/windsim/mlawson/wake_steering/stableABLRuns/48HrPer_0.001m_5m"
    #"/projects/dirs_to_delete/windsim/mlawson/wake_steering/stableABLRuns/infPer_0.15m_5m"
    #"/projects/dirs_to_delete/windsim/mlawson/wake_steering/stableABLRuns/infPer_0.001m_5m"
#    "/scratch/mlawson/stableABLRuns/24HrPer_0.15m_5m"
#    "/scratch/mlawson/stableABLRuns/24HrPer_0.001m_5m"
#    "/scratch/mlawson/stableABLRuns/48HrPer_0.15m_5m"
#    "/scratch/mlawson/stableABLRuns/48HrPer_0.001m_5m"
    #"/scratch/mlawson/stableABLRuns/infPer_0.15m_5m"
    #"/scratch/mlawson/stableABLRuns/infPer_0.001m_5m"
start=0
stop=719
for run in "${run_dir[@]}"
do
    for ((i=start; i<=stop; i++))
    do
        #echo $i
        #for j in 1000 2000 3000 4000 5000 6000 7000 8000 9000 11000 12000 13000 14000 16000 17000 18000 19000 21000 22000 23000 24000 26000 27000 28000 29000
        for j in 32450  32500  32550  32600  32650
	do
            echo rm -r $run/processor$i/$j
            rm -r $run/processor$i/$j
        done


    done
done
