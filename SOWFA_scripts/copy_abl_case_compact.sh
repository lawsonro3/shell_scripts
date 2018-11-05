#! /bin/bash

case_name=48HrPer_0.15m_5m
base=/projects/windsim/mlawson/wake_steering/stableABLRuns/$case_name
new=/scratch/mlawson/stableABLRuns/$case_name

if [[ ! -e ${new} ]]; then
    echo 'Making directory:' ${new} '...'
    mkdir ${new}
else
    echo 'The directory:' ${new} 'exists. Exiting...'
    exit 1
fi

start=0
stop=719
time=30000

cp $base/* $new/
cp -rs $base/constant $new/constant
cp -rs $base/system $new/system

for ((i=start; i<=stop; i++))
do

   echo $i

   mkdir $new/processor$i

   cp -rs $base/processor$i/constant $new/processor$i/
   cp -rs $base/processor$i/$time $new/processor$i/

done
