# Linuxium's scripts to create an Ubuntu LiveUSB

These scripts are for creating a custom Ubuntu LiveUSB ISO with latest audio fixes for Intel platforms. Users will be able to test if their audio subsystem is supported in the latest Linux kernels (patches already queued for upstream integration and experimental ones) and report issues.

The scripts are initially based on those documented on the following sites:

1. https://nathanpfry.com/how-to-customize-an-ubuntu-installation-disc/ (apparently no longer available)
2. https://wiki.ubuntu.com/KernelTeam/GitKernelBuild (shared under a Creative Commons Attribution-ShareAlike 3.0 License available at https://help.ubuntu.com/community/License)

and then further developed by Linuxium (linuxium@linuxium.com.au).

The scripts should be run as follows and in the sequence described:

- ./create-development-chroot.sh - creates a development chroot environment based on an Ubuntu release ISO
- ./enter-development-chroot.sh - enters the development chroot environment
- source start-compile-linux.source - downloads the latest experimental kernel with fixes for Intel audio platforms and compiles it as Debian binary packages
- source finish-compile-linux.source - cleans up the development chroot environment (and must be run prior to exiting the development chroot environment)
- ./exit-development-chroot.sh - exists the development chroot environment
- ./create-iso-chroot.sh - creates an ISO chroot environment based on an Ubuntu release ISO
- ./install-kernel.sh - installs the experimental kernel into the ISO chroot environment
- ./update-initrd.sh - updates the ISO chroot environment so the new custom ISO can boot the experimental kernel
- ./make-iso.sh - creates the custom ISO based on the ISO chroot environment

with the file 'include-chroot-variables.txt' containing common variables used in all the scripts.

The scripts are provided as is in the hope that they are useful using the same Creative Commons license as the original Ubuntu wiki. The user is alerted to the fact that using experimental audio drivers and firmware may result in hardware damage for which there is no warranty or liability.

