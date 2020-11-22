FROM ubuntu:focal

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
       python3 \
       python3-setuptools \
       python3-pip \
       qtbase5-dev \
       libglu1-mesa-dev \
       freeglut3-dev \
       mesa-common-dev \
       cmake \
       gnupg \
       gnupg2 \
       gnupg1 \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd 1001 -g 1001 \
    && groupadd 1000 -g 1000 \
    && groupadd 2000 -g 2000 \
    && groupadd 999 -g 999 \
    && useradd -ms /bin/bash conan -g 1001 -G 1000,2000,999 \
    && printf "conan:conan" | chpasswd \
    && adduser conan sudo \
    && printf "conan ALL= NOPASSWD: ALL\\n" >> /etc/sudoers \
    && pip3 install -q --upgrade --no-cache-dir pip \
    && pip3 install -q --no-cache-dir conan conan-package-tools \
    && wget -qO - https://packages.lunarg.com/lunarg-signing-key-pub.asc | apt-key add - \
    && wget -qO /etc/apt/sources.list.d/lunarg-vulkan-1.2.154-focal.list https://packages.lunarg.com/vulkan/1.2.154/lunarg-vulkan-1.2.154-focal.list \
    && apt update \
    && apt install -y vulkan-sdk


USER conan
WORKDIR /home/conan

RUN mkdir -p /home/conan/.conan
