#! /bin/bash

case_name=infPer_0.001m_5m
base=/projects/windsim/mlawson/wake_steering/stableABLRuns/$case_name
new=/projects/windsim/mlawson/wake_steering/stableABLRuns/infPer_0.15m_5m
mesh=/projects/windsim/mlawson/wake_steering/stableABLRuns/mesh_3000x2000x750_5m_720c

if [[ ! -e ${new} ]]; then
    echo 'Making directory:' ${new} '...'
    mkdir ${new}
else
    echo 'The directory:' ${new} 'exists. Exiting...'
    exit 1
fi

start=0
stop=719
time=0

cp $base/* $new/
cp -r $base/constant $new/
cp -r $base/system $new/

for ((i=start; i<=stop; i++))
do

   echo $i

   mkdir $new/processor$i

   cp -rs $mesh/processor$i $new/

done
