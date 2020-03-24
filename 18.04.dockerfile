FROM ubuntu:18.04

LABEL maintainer="Siyuan Wang <siyuan.arc@gmail.com>"

# change source
# http://mirrors.tuna.tsinghua.edu.cn/
# http://mirrors.ustc.edu.cn/
# RUN apt-get update && apt-get install -y gnupg && \
#     bash -c 'sed -i "s#http://archive.ubuntu.com/#http://mirrors.ustc.edu.cn/#" /etc/apt/sources.list; \
#              sed -i "s#http://security.ubuntu.com/#http://mirrors.ustc.edu.cn/#" /etc/apt/sources.list;' && \
#     bash -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ xenial main" > /etc/apt/sources.list.d/ros-latest.list' && \
#     apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

ENV USER thrimbda
ENV TERM xterm-256color

RUN apt-get update && apt-get install -y locales \
    curl \
    make \
    cmake \
    htop \
    zsh \
    unzip \
    git \
    sudo \
    vim

RUN adduser ${USER} --gecos "" --disabled-password &&\
    echo "alas\nalas" |passwd ${USER} &&\
    chsh -s $(grep /zsh$ /etc/shells | tail -1) ${USER} &&\
    adduser ${USER} sudo &&\
    cd /home &&\
    chown -R ${USER}:${USER} ${USER} &&\
    cd /home/${USER} &&\
    su ${USER}

# setup zsh envionment
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

USER ${USER}

RUN git clone --depth=2 https://github.com/amix/vimrc.git /opt/vim_runtime && \
    sh opt/vim_runtime/install_awesome_parameterized.sh /opt/vim_runtime --all


RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Thrimbda/shell-set-up/master/install_docker.sh)"

RUN echo "alas\n/bin/zsh" | chsh

CMD [ "zsh" ]

