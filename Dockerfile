FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    qemu \
    # qemu-system-arm -y -8 -7\
    gcc \
    git \
    binutils-arm-none-eabi \
    make \
    gcc-arm-none-eabi \
    libncurses-dev \
    flex \
    bison \
    openssl \
    libssl-dev \
    dkms \
    libelf-dev \
    libudev-dev \
    libpci-dev \
    libiberty-dev \
    autoconf \
    gcc-arm-linux-gnueabigcc \

RUN apt-get update && apt-get upgrade -y

RUN mkdir /workdir
WORKDIR /workdir

RUN mkdir files
COPY files .

# we should mount this repo
# RUN git clone https://github.com/torvalds/linux.git

#RUN qemu-system-arm -machine versatileab -cpu cortex-m4 -nographic -monitor null -semihosting -append 'some program arguments' -kernel program.axf

ENTRYPOINT ["/bin/bash"]