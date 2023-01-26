FROM ubuntu:latest AS msp430_toolchain 

ARG TOOLCHAIN=msp430-gcc-9.3.1.11_linux64

ENV PATH="$PATH:/sdk/${TOOLCHAIN}/bin:/sdk/${TOOLCHAIN}/msp430-elf/bin"
ENV HOME="/Workspace"

RUN apt update
RUN apt install -y wget bzip2
#RUN apt install -y make cmake git check
#RUN apt install -y build-essential
#RUN apt clean; apt autoclean; apt autoremove -y

RUN mkdir -p /sdk

WORKDIR /sdk

RUN wget "https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-LlCjWuAbzH/9.3.1.2/${TOOLCHAIN}.tar.bz2"
RUN bzip2 -d "${TOOLCHAIN}.tar.bz2"
RUN tar -xvf "${TOOLCHAIN}.tar"
RUN rm -rf "${TOOLCHAIN}.tar"

WORKDIR /Workspace