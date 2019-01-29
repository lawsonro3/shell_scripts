# Set install location
export inst_loc=/nopt/nrel/ecom/wind

# Set the default packages and compiler settings so that slurm is used
cp -f packages.yaml ~/.spack/linux/packages.yaml

# Get Spack and load spack
cd $inst_loc
echo Cloning Spack
git clone https://github.com/spack/spack.git
source $inst_loc/spack/share/spack/setup-env.sh
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

