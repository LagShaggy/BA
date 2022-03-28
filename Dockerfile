FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    qemu \
    # qemu-system-arm -y -8 -7\
    gcc \
    git \
    binutils-arm-none-eabi

RUN apt-get update && apt-get upgrade -y

RUN mkdir /workdir
WORKDIR /workdir

RUN mkdir files
COPY files ./files

RUN git clone git://sourceware.org/git/newlib-cygwin.git
RUN git clone https://github.com/torvalds/linux.git

#RUN qemu-system-arm -machine versatileab -cpu cortex-m4 -nographic -monitor null -semihosting -append 'some program arguments' -kernel program.axf

ENTRYPOINT [ "/bin/bash" ]