#!/bin/bash
cd /tmp
mkdir coreos; cd coreos
wget http://stable.release.core-os.net/amd64-usr/current/coreos_production_qemu.sh
wget http://stable.release.core-os.net/amd64-usr/current/coreos_production_qemu_image.img.bz2 -O - | bzcat > coreos_production_qemu_image.img
chmod +x coreos_production_qemu.sh
