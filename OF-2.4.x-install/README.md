# Note
1. This script installs OpenFOAM-2.4.x and SOWFA.
1. If something goes wrong, the first thing to look at is the `$inst_dir` variable in the install and env scripts.

# Install
1. Download the install scripts into the folder where you want to install OpenFOAM.
```wget https://raw.githubusercontent.com/lawsonro3/shell_scripts/master/OF-2.4.x-install/OF-2.4.x-install.sh; wget https://raw.githubusercontent.com/lawsonro3/shell_scripts/master/OF-2.4.x-install/OF-2.4.x-env-spack; wget https://raw.githubusercontent.com/lawsonro3/shell_scripts/master/OF-2.4.x-install/OF-2.4.x-bashrc-patch```
1. Set the correct `$inst_dir` in the `OF-2.4.x-install.sh` and `OF-2.4.x-env-spack` files.
1. Run the install script ```source OF-2.4.x-install.sh```

# Other stuff
* This script only works on linux systems
* If this does not work, PLEASE submit a bug report or email me!
