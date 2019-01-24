#!/bin/bash

# This script installs OpenFOAM 2.4.x and SOWFA on a linux system using spack to install all dependencies
# This script is somewhat of a hack, use as your own risk...

# Set install location
export inst_loc=/home/$USER/OpenFOAM

# Get Spack and load spack
cd $inst_loc
echo Cloning Spack
git clone https://github.com/spack/spack.git
source $inst_loc/spack/share/spack/setup-env.sh
mkdir ~/.spack
cp ../packages.yaml ~/.spack

# Install dependencies with Spack
echo Installing dependencies with Spack
module purge
spack compiler find
spack install gcc@4.8.5
spack load gcc
rm ~/.spack/linux/compilers.yaml
spack compiler find
spack install openmpi@1.7.3 cgal@4.12 boost@1.69.0 mpfr@3.1.6 scotch@6.0.6 flex@2.6.3

# Get OpenFOAM-2.4.x
echo Cloning OpenFOAM-2.4.x
# mv OpenFOAM-2.4.x OpenFOAM-2.4.x-install-backup
git clone https://github.com/OpenFOAM/OpenFOAM-2.4.x.git

# Patch OpenFOAM to use a version of flex higher than 2.5
echo Patching OpenFOAM to use a Flex version higher than 2.5
cd OpenFOAM-2.4.x
find src applications -name "*.L" -type f | xargs sed -i -e 's=\(YY\_FLEX\_SUBMINOR\_VERSION\)=YY_FLEX_MINOR_VERSION < 6 \&\& \1='
cd ..

# Patch bashrc to deal with problem purging up the bash env
cd OpenFOAM-2.4.x
rm etc/bashrc-install-backup
mv etc/bashrc etc/bashrc-install-backup
mv ../OF-2.4.x-bashrc-patch etc/bashrc
cd ..

# Compile OpenFOAM
source OF-2.4.x-env-spack # This script should have been downloaded and should be in the home directory
OpenFOAM-2.4.x-spack
cd OpenFOAM-2.4.x
./Allwmake
cd ..

# Get SOWFA
echo Cloning SOWF
# mv SOWFA SOWFA-install-backup
git clone https://github.com/NREL/SOWFA.git

# Patch SOWFA to use correct link directory for compilation
cd SOWFA
find applications src -name "options" -type f | xargs sed -i -e 's\WM_PROJECT_USER_DIR\SOWFA_DIR\g'
cd ..

# Compile SOWFA
cd SOWFA
./Allwmake
cd ..
