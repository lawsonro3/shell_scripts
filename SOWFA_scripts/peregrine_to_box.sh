# #!/bin/bash
#
# case=48HrPer_0.001m_5m_ADM
#
# source_loc=peregrine:/scratch/mlawson/stableABLRuns/${case}
# dest=/Users/mlawson/Box/Work/wind_plant_controls/stable_abl/${case}
#
# mkdir ${dest}
#
# # for ADM backup
# latest_time=32750
# rsync -av --no-links ${source_loc}/runscript* $dest
# rsync -av --no-links ${source_loc}/*log.2* $dest
# rsync -av --no-links ${source_loc}/setUp $dest
#
# folder=constant
# rsync -av --no-links --exclude 'polyMesh' --exclude '*.gz' --exclude 'forcingTable' ${source_loc}/${folder} ${dest}
#
# folder=system
# rsync -av --no-links --exclude '*.gz' ${source_loc}/${folder} ${dest}
#
# folder=postProcessing/array.mean
# mkdir ${dest}/postProcessing
# mkdir ${dest}/${folder}
# rsync -av --no-links --exclude '*.gz' ${source_loc}/${folder}/${latest_time} ${dest}/${folder}
#
# folder=turbineOutput
# mkdir ${dest}/${folder}
# rsync -av --no-links --exclude '*.gz' ${source_loc}/${folder}/${turbine_time} ${dest}/${folder}


## for precursor backup
case=24HrPer_0.001m_5m
source_loc=peregrine:/projects/ssc/mlawson/stable_abl/${case}
dest=/Users/mlawson/Box/Work/wind_plant_controls/stable_abl/${case}

mkdir ${dest}

start_time=20000
rsync -av --no-links ${source_loc}/runscript* $dest
rsync -av --no-links ${source_loc}/*log.3* $dest
rsync -av --no-links ${source_loc}/setUp $dest

folder=constant
rsync -av --no-links --exclude 'polyMesh' --exclude '*.gz' --exclude 'forcingTable' ${source_loc}/${folder} ${dest}

folder=system
rsync -av --no-links --exclude '*.gz' ${source_loc}/${folder} ${dest}

folder=postProcessing/averaging
mkdir ${dest}/postProcessing
mkdir ${dest}/${folder}
rsync -av --no-links --exclude '*.gz' ${source_loc}/${folder}/${start_time} ${dest}/${folder}
