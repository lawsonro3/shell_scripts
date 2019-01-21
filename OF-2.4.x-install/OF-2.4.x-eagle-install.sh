#!/bin/bash

# This script should be run in the your OpenFOAM base directory, e.g. ~/OpenFOAM/
# You should not have downloaded anything yet, e.g. let this script download OF, SOWFA, spack, etc.

# Get OF
echo Cloning OpenFOAM-2.4.x
git clone https://github.com/OpenFOAM/OpenFOAM-2.4.x.git

# Patch to use flex >=2.6
echo Patching OpenFOAM to use a Flex version higher than 2.5
cd OpenFOAM-2.4.x
find src applications -name "*.L" -type f | xargs sed -i -e 's=\(YY\_FLEX\_SUBMINOR\_VERSION\)=YY_FLEX_MINOR_VERSION < 6 \&\& \1='
cd ../

# Get SOWFA
echo Cloning SOWF
git clone https://github.com/NREL/SOWFA.git

# Get Spack and add to front of path
echo Cloning Spack
git clone https://github.com/spack/spack.git
source $PWD/spack/share/spack/setup-env.sh

# Install stuff with Spack
echo Installing stuff with Spack
module purge
spack install gcc@4.8.5
spack load gcc
g_fort=$(which gfortran)
sed -i -e 's|null|'"$g_fort"'|g' ~/.spack/linux/compilers.yaml
spack install openmpi@1.7.3 cgal@4.12 boost@1.69.0 mpfr@3.1.6 readline@7.0 scotch@6.0.6 flex@2.6.3
spack load openmpi@1.7.3 cgal@4.12 boost@1.69.0 mpfr@3.1.6 readline@7.0 scotch@6.0.6 flex@2.6.3

# Compile OpenFOAM
source OF-2.4.x-env-spack
OpenFOAM-2.4.x-spack
cd OpenFOAM-2.4.x
./Allwmake
cd ..

# Compile SOWFA
cd SOWFA
find applications -name "options" -type f | xargs sed -i -e 's=\FOAM_USER_APPBIN\SOWFA_DIR\g'
./Allwmake
cd ..
