#!/bin/bash

# Linuxium's scripts to create an Ubuntu LiveUSB

source include-chroot-variables.txt


# get Ubuntu ISO
rm -f ubuntu.iso
[ ! -f ${PATH_TO}/${CANONICAL_ISO} ] && echo "Cannot find '${PATH_TO}/${CANONICAL_ISO}' ... exiting." && exit
ln -s ${PATH_TO}/${CANONICAL_ISO} ubuntu.iso

# mount Ubuntu ISO
[ -f mnt ] && rm -f mnt
[ -d mnt ] || mkdir mnt
sudo mount -o loop ubuntu.iso mnt 2> /dev/null

# extract iso directory structure from ISO
sudo rm -rf iso-directory-structure
sudo rsync --exclude=/casper/filesystem.squashfs -a mnt/ iso-directory-structure

# extract iso chroot file system from ISO
sudo rm -rf squashfs-root iso-chroot
sudo unsquashfs mnt/casper/filesystem.squashfs
sudo mv squashfs-root iso-chroot

# unmount Ubuntu ISO
sudo umount mnt
rmdir mnt

