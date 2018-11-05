#! /bin/bash
start=0
stop=719
time=30000

base=/projects/windsim/mlawson/wake_steering/stableABLRuns/mesh_3000x2000x750_5m_720c
link=/projects/windsim/mlawson/wake_steering/stableABLRuns/24HrPer_0.15m_5m

# Link poly mesh and the 0 directory
# for ((i=start; i<=stop; i++))
# do
#
#     echo $i
#     rm $link/processor$i/constant/polyMesh/*
#     ln -s $base/processor$i/constant/polyMesh/* $link/processor$i/constant/polyMesh/
#
#     rm -rf $link/processor$i/0
#     ln -s $base/processor$i/0 $link/processor$i/0
#
# done

# Make sure the system and constant files are in the right place
cp -rf $base/system/changeDictionaryDict.updateBCs.* $base/system/decompose* $base/system/fv* $base/system/topo* $base/system/setFields* $link/system/
