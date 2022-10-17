FROM ubuntu:jammy

LABEL maintainer="Gavin Wolf"

ENV CXX=/usr/bin/g++ \
    CC=/usr/bin/gcc \
    TZ="America/New_York"

RUN dpkg --add-architecture i386 \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
       sudo \
       binutils \
       wget \
       git \
       libgmp-dev \
       libmpfr-dev \
       libmpc-dev \
       nasm \
       dh-autoreconf \
       ninja-build \
       libffi-dev \
       libssl-dev \
       pkg-config \
       subversion \
       zlib1g-dev \
       libbz2-dev \
       libsqlite3-dev \
       libreadline-dev \
       xz-utils \
       curl \
       libncurses5-dev \
       libncursesw5-dev \
       liblzma-dev \
       ca-certificates \
       autoconf-archive \
       g++ \
       gcc \
       g++-12 \
       gcc-12 \
       make \
       clang \
       python3 \
       python3-setuptools \
       python3-pip \
       qtbase5-dev \
       libglu1-mesa-dev \
       freeglut3-dev \
       mesa-common-dev \
       libvulkan-dev \
       cmake \
      && ln -s /usr/include/locale.h /usr/include/xlocale.h \
      && rm -rf /var/lib/apt/lists/* 

RUN groupadd user -g 1000 \
    && useradd -ms /bin/bash user -g 1000 \
    && printf "user:user" | chpasswd \
    && adduser user sudo \
    && printf "user ALL= NOPASSWD: ALL\\n" >> /etc/sudoers 


USER user
WORKDIR /home/user
ENV PATH=/home/user/.local/bin:$PATH
RUN pip3 install -q --upgrade --no-cache-dir pip 
RUN pip3 install -q --no-cache-dir conan conan-package-tools
RUN mkdir -p /home/user/.conan
