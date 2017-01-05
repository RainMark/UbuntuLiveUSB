#!/bin/bash

# Linuxium's scripts to create an Ubuntu LiveUSB

source include-chroot-variables.txt

[ -d initrd ] && rm -rf initrd
mkdir initrd
cd initrd
sudo dd status=none if=../iso-directory-structure/casper/initrd.lz | gzip -d | sudo cpio -id

# add in UCM files for sound
sudo mkdir -p usr/share/alsa/ucm
sudo cp -rf ${PATH_TO}/UCM-master/* usr/share/alsa/ucm

sudo rm -f ../iso-directory-structure/casper/initrd.lz
sudo find | sudo cpio -o -H newc | gzip | sudo tee ../iso-directory-structure/casper/initrd.lz > /dev/null
cd ..
sudo rm -rf initrd

