#!/bin/bash

# Get Spack and add to front of path
cd /home/$USER/OpenFOAM
echo Cloning Spack
git clone https://github.com/spack/spack.git
source /home/$USER/OpenFOAM/spack/share/spack/setup-env.sh

# Install stuff with Spack
echo Installing stuff with Spack
module purge
spack install gcc@4.8.5
spack load gcc
g_fort=$(which gfortran)
sed -i -e 's|null|'"$g_fort"'|g' ~/.spack/linux/compilers.yaml
spack install openmpi@1.7.3 cgal@4.12 boost@1.69.0 mpfr@3.1.6 readline@7.0 scotch@6.0.6 flex@2.6.3

# Get OF
echo Cloning OpenFOAM-2.4.x
git clone https://github.com/OpenFOAM/OpenFOAM-2.4.x.git

# Patch to use flex >=2.6
echo Patching OpenFOAM to use a Flex version higher than 2.5
cd OpenFOAM-2.4.x
find src applications -name "*.L" -type f | xargs sed -i -e 's=\(YY\_FLEX\_SUBMINOR\_VERSION\)=YY_FLEX_MINOR_VERSION < 6 \&\& \1='
cd ..


# Compile OpenFOAM
source OF-2.4.x-env-spack
OpenFOAM-2.4.x-spack
echo "Purging modules..."
module purge
module use /home/$USER/OpenFOAM/spack/share/spack/modules/linux-centos7-x86_64
module load openmpi-1.7.3-gcc-4.8.5-p3zhhpm
module load gcc-4.8.5-gcc-4.8.5-nkqvx2b
module load cgal-4.12-gcc-4.8.5-3rapycz
module load boost-1.69.0-gcc-4.8.5-52cfbc4
module load mpfr-3.1.6-gcc-4.8.5-kflyoj7
module load readline-7.0-gcc-4.8.5-b4z2xcj
module load scotch-6.0.6-gcc-4.8.5-7q5mr7x
module load flex-2.6.3-gcc-4.8.5-fmg4vap
module list
cd OpenFOAM-2.4.x
./Allwmake
cd ..

# Get SOWFA
echo Cloning SOWF
git clone https://github.com/NREL/SOWFA.git

# Patch SOWFA to use correct link directory for compilation
cd SOWFA
find applications -name "options" -type f | xargs sed -i -e 's=\WM_PROJECT_USER_DIR\SOWFA_DIR\g'
cd ..

# Compile SOWFA
cd SOWFA
./Allwmake
cd ..
