#!/bin/sh
echo "\ndeb     http://ftp.de.debian.org/debian/    stable main contrib non-free\ndeb-src http://ftp.de.debian.org/debian/ stable main contrib non-free buildd" >> /etc/apt/sources.list
cat /etc/apt/sources.list
apt-get update -y  && apt-get install git binfmt-support ssh binutils build-essential -y
ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts
git clone -b m68k-next https://github.com/knickish/qemu-m68k.git
cd qemu-m68k/
apt-get build-dep qemu -y
./configure --target-list=m68k-linux-user --static --disable-glusterfs
make
cd build/m68k-linux-user/
strip qemu-m68k 
apt-get install qemu-user-static
cp -av qemu-m68k /usr/bin/qemu-m68k-static 
