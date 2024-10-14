#!/bin/sh
cd /root/llvm-project
cmake \
    -S llvm \
    -B build_extern \
    -G Ninja \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DLLVM_OPTIMIZED_TABLEGEN=ON \
    -DLLVM_ENABLE_PROJECTS="lld;clang" \
    -DLLVM_TARGETS_TO_BUILD="M68k;X86" \
    -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="M68k" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY
ninja -C build_extern install