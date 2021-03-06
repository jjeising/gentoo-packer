#!/bin/bash

tarball=stage3-amd64-$STAGE3.tar.bz2

mount /dev/sda4 /mnt/gentoo

echo 'Testing stage3 mirrors'
MIRROR=`mirrorselect -b10 -D -s1 -o -H -c 'Germany' | grep 'GENTOO_MIRRORS='`

cd /mnt/gentoo
echo 'Download stage3'
curl -sLO --progress-bar --retry 4 --retry-delay 1 ${MIRROR:16:-1}releases/amd64/autobuilds/$STAGE3/$tarball
echo 'Untar stage3'
tar xjpf $tarball
echo 'Remove tarball'
rm $tarball