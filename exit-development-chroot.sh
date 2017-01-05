#!/bin/bash

# Linuxium's scripts to create an Ubuntu LiveUSB

CHROOT_ENVIRONMENT="development-chroot"
[ ! -d ${CHROOT_ENVIRONMENT} ] && echo "Chroot environment '${CHROOT_ENVIRONMENT}' not found ... exiting." && exit

# exit chroot
sudo umount ${CHROOT_ENVIRONMENT}/dev

