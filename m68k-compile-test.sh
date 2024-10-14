#!/bin/sh
cd /
clang /tmp/test_0.c \
    -o /tmp/zero \
    -target m68k-linux-gnu
clang /tmp/test_1.c \
    -o /tmp/one \
    -target m68k-linux-gnu
cp /tmp/zero /sid-m68k-sbuild/zero
cp /tmp/one /sid-m68k-sbuild/one

chroot /sid-m68k-sbuild /m68k-clang-smoketest.sh
