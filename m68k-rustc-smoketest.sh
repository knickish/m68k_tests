#!/bin/sh
. "$HOME/.cargo/env" 
cd /tmp/rustc_smoketest
rustup toolchain link m68k /root/rust/build/x86_64-unknown-linux-gnu/stage1/
rustup default m68k

rustc ./src/bin/zero.rs \
    -Clinker=m68k-linux-gnu-ld \
    -o /tmp/zero \
    --target m68k-unknown-linux-gnu
rustc ./src/bin/one.rs \
    -Clinker=m68k-linux-gnu-ld \
    -o /tmp/one \
    --target m68k-unknown-linux-gnu

cp /tmp/zero /sid-m68k-sbuild/zero
cp /tmp/one /sid-m68k-sbuild/one

chroot /sid-m68k-sbuild /m68k-clang-smoketest.sh
