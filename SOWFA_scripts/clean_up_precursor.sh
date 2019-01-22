#! /bin/bash

declare -a run_dir="/projects/ssc/mlawson/stable_abl/24HrPer_0.001m_5m_ADM"
 "/projects/ssc/mlawson/stable_abl/infPer_0.001m_5m_ADM"
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
#        for j in 31000  32000  33000  34000 36000  36999.9999999  37999.9999999  38999.9999999
#	do
#            echo rm -r $run/processor$i/$j
#            rm -r $run/processor$i/$j
#        done
	cd $run/processor$i
	pwd
	rm -r 30250  30500  30750  31250  31500  31750  32250  32500  32750  33000 30050  30300  30550  30800  31050  31300  31550  31800  32050  32300  32550  32800  30100  30350  30600  30850  31100  31350  31600  31850  32100  32350  32600  32850 30150  30400  30650  30900  31150  31400  31650  31900  32150  32400  32650  32900 30200  30450  30700  30950  31200  31450  31700  31950  32200  32450  32700


    done
done
