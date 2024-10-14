FROM --platform=linux/amd64 debian

# install qemu
WORKDIR /
COPY m68k-qemu-install.sh .
RUN chmod +x m68k-qemu-install.sh
RUN ./m68k-qemu-install.sh

# setup chroot
WORKDIR /
COPY m68k-debootstrap-chroot-install.sh .
RUN chmod +x m68k-debootstrap-chroot-install.sh
RUN ./m68k-debootstrap-chroot-install.sh
COPY sources.list /sid-m68k-sbuild/etc/apt/

# install clang and cross-compilation deps
WORKDIR /
RUN apt install \
    cmake ninja-build curl \
    gcc-m68k-linux-gnu g++-m68k-linux-gnu -y

USER root
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y

# copy clang/llvm setup and test scripts
COPY m68k-clang-install.sh .
RUN chmod +x m68k-clang-install.sh
COPY m68k-compile-test.sh .
RUN chmod +x m68k-compile-test.sh
COPY m68k-clang-smoketest.sh /sid-m68k-sbuild/
RUN chmod +x /sid-m68k-sbuild/m68k-clang-smoketest.sh

# copy rustc setup and build scripts
COPY m68k-rust-build.sh .
RUN chmod +x m68k-rust-build.sh
COPY m68k-rust-setup.sh .
RUN chmod +x m68k-rust-setup.sh
COPY m68k-rustc-smoketest.sh .
RUN chmod +x m68k-rustc-smoketest.sh

# copy smoketest files
COPY test_0.c /tmp
COPY test_1.c /tmp
COPY config.toml /tmp

# add the location where llvm will install itself and clang) to PATH
RUN export PATH="/usr/local/bin/:/usr/local/lib:/usr/local/include:/usr/local/include/bits:${PATH}"
ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /