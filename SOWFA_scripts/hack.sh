#! /bin/bash
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/24HrPer_0.001m_5m
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/24HrPer_0.15m_5m
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/48HrPer_0.001m_5m
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/48HrPer_0.15m_5m
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/infPer_0.001m_5m
#run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/infPer_0.15m_5m

run_dir=/projects/dirs_to_delete/windsim/mlawson/wake_steering/stableABLRuns/24HrPer_0.15m_5m
#mesh_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/mesh_3000x2000x750_5m_720c
mesh_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/mesh_3000x2000x750_5m_720c
start=0
stop=719
time=30000

for ((i=start; i<=stop; i++))
do
    #echo $i
    for j in 1000 2000 3000 4000 5000 6000 7000 8000 9000 11000 12000 13000 14000 16000 17000 18000 19000 21000 22000 23000 24000 26000 27000 28000 29000
    do
        echo rm -r $run_dir/processor$i/$j
        rm -r $run_dir/processor$i/$j
        #rm -r $run_dir/processor$i/constant/polyMesh
        #cp -rs $mesh_dir/processor$i/constant/polyMesh $run_dir/processor$i/constant/
    done


done
