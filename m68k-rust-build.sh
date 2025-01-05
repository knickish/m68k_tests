#!/bin/bash
ls /root/.cargo/bin
pwd
cp /tmp/config.toml /root/rust/config.toml
cd /root/rust
which x

# export RUSTFLAGS="-Ccodegen-units=1 -Csave-temps --emit=llvm-ir -Zno-parallel-backend"
export RUSTFLAGS="-Ccodegen-units=8"

x build \
    --target m68k-unknown-linux-gnu \
    -j 8 \
    library/alloc

# x build \
#     --target m68k-unknown-linux-gnu \
#     -j 1 \
#     library/alloc
