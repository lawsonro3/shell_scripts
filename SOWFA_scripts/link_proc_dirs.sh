#! /bin/bash
run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/24HrPer_0.001m_5m
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/24HrPer_0.15m_5m
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/48HrPer_0.001m_5m
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/48HrPer_0.15m_5m
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/infPer_0.001m_5m
#run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/infPer_0.15m_5m

new_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/48HrPer_0.001m_5m_ADM
#mesh_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/mesh_3000x2000x750_5m_720c

start=0
stop=719
time=30000

for ((i=start; i<=stop; i++))
do
    echo $i
    mkdir $new_dir/processor$i
    cp -rs $run_dir/processor$i/$time $new_dir/processor$i/$time
    cp -rs $run_dir/processor$i/constant $new_dir/processor$i/constant


done
