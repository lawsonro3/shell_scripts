#!/bin/bashc

# This scropt should be run in the your OpenFOAM base directory, e.g. ~/OpenFOAM/
# There you should not have downloaded anything yet, e.g. let this script download OF, SOWFA, spack, etc

# Get OF
echo Cloning OpenFOAM-2.4.x
git clone https://github.com/OpenFOAM/OpenFOAM-2.4.x.git

# Patch to use flex >=2.6
echo Patching to use flex version >=2.6
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
spack install openmpi@1.7.3 cgal@4.12 boost@1.69 mpfr@3.1.6 readline@7.0 scotch@6.0.6 flex@2.6.3
spack load openmpi@1.7.3 cgal@4.12 boost@1.69 mpfr@3.1.6 readline@7.0 scotch@6.0.6 flex@2.6.3

# Compile OpenFOAM
wget https://github.com/lawsonro3/shell_scripts/raw/master/SOWFA_scripts/OF-2.4.x-env
source OF-2.4.x-env
OpenFoam-2.4.x
cd OpenFOAM-2.4.x
./Allwmake
