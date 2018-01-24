#! /bin/bash

# This script creates a new SOWFA run directory from a mesh directory created using the runscript.preprocess script avaiable in the `exampleCases` folder in SOWFA. This script created copies of all processor# folders. Files in the processor# folders are linked to save space. The constant and system folders and all files on the top level of the directory are copied so settings can be changes without evfecting the base folder.

exec_dir = $PWD
base=$PWD/$1
new=$PWD/$2
echo 'Base directory:' ${base}
echo 'New directory:' ${new}

if [[ ! -e ${new} ]]; then
    echo 'Making directory:' ${new} '...'
    mkdir ${new}
else
    echo 'The directory:' ${new} 'exists. Exiting...'
    exit 1
fi

# Create sysbolic links to files with read directory folders
echo 'Copying folders and linking files...'

cp -rs ${base}/* ${new}/

# Remove links for top level file links and replace with actual files
rm ${new}/* 2> /dev/null
cp ${base}/* ${new}/ 2> /dev/null

# Delete linked system folder and copy over actual system folder
rm -r ${new}/system ${new}/constant
cp -r ${base}/system ${new}/system
cp -r ${base}/constant ${new}/constant

cd ${new}
echo 'Files and directories in this folder were linked or copies from' ${base} 'on' `date`>>linkInfo.txt
cd ${exec_dir}
