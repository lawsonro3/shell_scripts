#! /bin/bash

case_name=infPer_0.001m_5m_ADM
base=/scratch/mlawson/stableABLRuns/$case_name
new=/scratch/mlawson/stableABLRuns/${case_name}_20degYaw

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
cp -r $base/constant $new/
cp -r $base/system $new/

for ((i=start; i<=stop; i++))
do

   echo $i

   mkdir $new/processor$i

   cp -rs $base/processor$i/constant $new/processor$i/
   cp -rs $base/processor$i/$time $new/processor$i/

done
