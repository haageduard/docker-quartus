FROM ubuntu:xenial
ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN apt-get update && \
    apt-get -y -qq install apt-utils sudo && \
    apt-get -y -qq install locales && locale-gen en_US.UTF-8 && \
    apt-get -y -qq install software-properties-common \
        ca-certificates \
        lib32ncurses5-dev \
        libc6:i386 \
        libcrypto++9v5 \
        libfontconfig1 \
        libglib2.0-0 \
        libncurses5:i386 \
        libsm6 \
        libssl-dev \
        libstdc++6:i386 \
        libxext6:i386 \
        libxft2:i386 \
        libxrender1 \
        libzmq3-dev \
        locales \
        make \
        openjdk-8-jdk \
        pkg-config \
        unixodbc-dev \
        wget \
        xauth \
        xvfb \
        xterm

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

# switch to user's context
USER developer

CMD xterm -e "/home/developer/quartus/quartus/bin/quartus --64bit"
