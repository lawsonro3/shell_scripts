# This spack setup gets the packages that are needed to install OpenFOAM-2.4.x and sets the packages.yaml file

# Set install location - commented out so that it forces you to do this
# export spack_loc=/nopt/nrel/ecom/wind

# Set the default packages and compiler settings so that slurm is used
cp -f packages-OF-2.4.x.yaml ~/.spack/linux/packages.yaml

# Get Spack and load spack
cd $spack_loc
echo Cloning Spack
git clone https://github.com/spack/spack.git
source $spack_loc/spack/share/spack/setup-env.sh
spack install gcc@4.8.5
spack load gcc@4.8.5
rm ~/.spack/linux/compilers.yaml
spack compiler find
spack install openmpi@1.10.7 %gcc@4.8.5
spack install cgal@4.12 %gcc@4.8.5
spack install boost@1.69.0 %gcc@4.8.5
spack install mpfr@3.1.6 %gcc@4.8.5
spack install readline@7.0 %gcc@4.8.5
spack install scotch@6.0.6 %gcc@4.8.5
spack install flex@2.6.4 %gcc@4.8.5
spack install git
cd -

# This is hot to load everything using modules
#echo "Purging modules..."
#module purge
#module use $spack_loc/spack/share/spack/modules/linux-centos7-x86_64
#module load gcc-4.8.5-gcc-4.8.5-nkqvx2b
#module load openmpi-1.10.7-gcc-4.8.5-qu7mrny
#module load cgal-4.12-gcc-4.8.5-vd4qb7j
#module load boost-1.69.0-gcc-4.8.5-52cfbc4
#module load mpfr-3.1.6-gcc-4.8.5-kflyoj7
#module load readline-7.0-gcc-4.8.5-b4z2xcj
#module load scotch-6.0.6-gcc-4.8.5-3xkg4i7
#module load flex-2.6.4-gcc-4.8.5-htapbeu
#module load gmp-6.1.2-gcc-4.8.5-6bsovvk
#module list
