# Note
1. This script installs OpenFOAM-2.4.x and SOWFA.
1. If something goes wrong, the first thing to look at is the `$inst_dir` variable in the install and env scripts.
1. If you are not running this install script on a machine where you have the neccisary packages installed with spack, then you will have to install spack and the packages noted here - https://github.com/lawsonro3/shell_scripts/tree/master/spack_setup
1. This script only works on linux systems
1. If this does not work, PLEASE submit a bug report or email me!

# Install
1. Download the install scripts into the folder where you want to install OpenFOAM.
```wget https://raw.githubusercontent.com/lawsonro3/shell_scripts/master/OF-2.4.x-install/OF-2.4.x-install.sh; wget https://raw.githubusercontent.com/lawsonro3/shell_scripts/master/OF-2.4.x-install/OF-2.4.x-env-spack```
1. Set the correct `$inst_dir` in the `OF-2.4.x-install.sh` and `OF-2.4.x-env-spack` files.
1. Run the install script ```source OF-2.4.x-install.sh```

# Use
* In your ~/.bashrc or equivalent, source the `OF-2.4.x-env-spack`, e.g. `source OF-2.4.x-env-spack`. This will create the bash function `OF-2.4.x-env-spack` that you can run from a shell that will load the OpenFOAM-2.4.x and SOWFA-2.4.x enviornment.
