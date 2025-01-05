#!/bin/sh
cd /
clang /tmp/test_0.c \
    -o /tmp/zero \
    -target m68k-linux-gnu
clang /tmp/test_1.c \
    -o /tmp/one \
    -target m68k-linux-gnu
clang /tmp/test_int_size.c \
    -o /tmp/int_size \
    -target m68k-linux-gnu
cp /tmp/zero /sid-m68k-sbuild/zero
cp /tmp/one /sid-m68k-sbuild/one
cp /tmp/int_size /sid-m68k-sbuild/int_size


chroot /sid-m68k-sbuild /m68k-clang-smoketest.sh
