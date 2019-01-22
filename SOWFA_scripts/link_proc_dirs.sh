#! /bin/bash
run_dir=/projects/ssc/mlawson/stable_abl/infPer_0.001m_5m_ADM
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/24HrPer_0.15m_5m
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/48HrPer_0.001m_5m
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/48HrPer_0.15m_5m
# run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/infPer_0.001m_5m
#run_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/infPer_0.15m_5m

new_dir=/scratch/mlawson/stableABLRuns/infPer_0.001m_5m_ADM_20degYaw
#mesh_dir=/projects/windsim/mlawson/wake_steering/stableABLRuns/mesh_3000x2000x750_5m_720c

start=0
stop=719
time=30000

for ((i=start; i<=stop; i++))
do
    echo $i
    rm -rf $new_dir/processor$i/$time
    rm -rf $new_dir/processor$i/constant
    cp -rs $run_dir/processor$i/$time $new_dir/processor$i/$time
    cp -rs $run_dir/processor$i/constant $new_dir/processor$i/constant


done
