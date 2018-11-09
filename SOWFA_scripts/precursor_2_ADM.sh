#! /bin/bash

case_name=48HrPer_0.001m_5m
base=/projects/windsim/mlawson/wake_steering/stableABLRuns/$case_name

case_name=48HrPer_0.001m_5m_ADM
new=/projects/windsim/mlawson/wake_steering/stableABLRuns/$case_name

if [[ ! -e ${new} ]]; then
    echo 'Making directory:' ${new} '...'
    mkdir ${new}
else
    echo 'The directory:' ${new} 'exists. Exiting...'
#    exit 1
fi

start=0
stop=719
time=30000

cp -r $base/0 $new/

#cp $base/* $new/
#cp -r $base/constant $new/
#cp -r $base/system $new/

for ((i=start; i<=stop; i++))
do

   echo $i

   mkdir $new/processor$i

   cp -rs $base/processor$i/constant $new/processor$i/

done
