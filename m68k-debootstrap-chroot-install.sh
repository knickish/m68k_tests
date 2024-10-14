apt-get install sbuild schroot debootstrap debian-ports-archive-keyring -y
debootstrap --no-check-gpg --variant=buildd --foreign --arch=m68k unstable sid-m68k-sbuild http://ftp.ports.debian.org/debian-ports/
cp -a /usr/bin/qemu-m68k-static ./sid-m68k-sbuild/usr/bin/qemu-m68k-static
cd sid-m68k-sbuild/
chroot . ./debootstrap/debootstrap --second-stage
cd /