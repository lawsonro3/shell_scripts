#! /bin/bash

basedir=/scratch/mlawson/wakeSteeringSims/stableABLRuns/mesh_3000mx2000mx750m_5mRes_720core
lndir=/scratch/mlawson/wakeSteeringSims/stableABLRuns/0degVeer_0.15mRough_5mRes
start=0
stop=719


for i in {0..719}
do
    echo $i
    rm -rf $lndir/processor$i/constant
    cp -rs $basedir/processor$i/constant $lndir/processor$i/
done
