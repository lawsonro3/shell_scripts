#!/bin/bash
OpenFOAM-2.4.x-spack()
{
   # Unset OpenFOAM environment variables.
   if [ -z "$FOAM_INST_DIR" ]; then
      echo "Nothing to unset..."
   else
      echo "Unsetting OpenFOAM environment variables..."
      . $FOAM_INST_DIR/OpenFOAM-$OPENFOAM_VERSION/etc/config/unset.sh
   fi

   # Unload any compilers already loaded
   echo "Purging modules..."
   module purge
   . $PWD/spack/share/spack/setup-env.sh
   spack load openmpi@1.7.3
   spack load cgal@4.12
   spack load boost@1.69.0
   spack load mpfr@3.1.6
   spack load readline@7.0
   spack load scotch@6.0.6
   spack load flex@2.6.3
   module list

   # Set the OpenFOAM version and installation directory
   export OPENFOAM_VERSION=2.4.x
   export OPENFOAM_NAME=OpenFOAM-$OPENFOAM_VERSION
   export FOAM_INST_DIR=$PWD
   export WM_PROJECT_USER_DIR=/home/$USER/$USER-$OPENFOAM_VERSION
   export SOWFA_DIR=$FOAM_INST_DIR/SOWFA

   foamDotFile=$FOAM_INST_DIR/$OPENFOAM_NAME/etc/bashrc
   if [ -f $foamDotFile ] ; then
      echo "Sourcing $foamDotFile..."
      source $foamDotFile
   fi

   export WM_NCOMPPROCS=12
   export WM_COLOURS="white blue green cyan red magenta yellow"

   alias tut='cd /home/$USER/OpenFOAM/$USER-$OPENFOAM_VERSION/tutorials'
}
