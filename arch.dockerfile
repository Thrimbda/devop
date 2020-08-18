FROM archlinux:latest

LABEL maintainer="Siyuan Wang <siyuan.arc@gmail.com>"

RUN bash -c "sed -e '1,$ s/^#*/#/' -i /etc/pacman.d/mirrorlist" && \
    bash -c "sed -e '1 iServer = http://mirrors.aliyun.com/archlinux/\$repo/os/\$arch' -i /etc/pacman.d/mirrorlist" && \
    pacman -Syy --noconfirm

RUN pacman -Syyuu --noconfirm && \
    pacman -S --noconfirm curl \
    make \
    zsh \
    unzip \
    git \
    vim \
    python \
    clang \
    jdk11-openjdk

RUN git clone --depth=2 https://github.com/amix/vimrc.git /opt/vim_runtime && \
    sh opt/vim_runtime/install_awesome_parameterized.sh /opt/vim_runtime --all

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Thrimbda/shell-set-up/master/install_docker.sh)"

RUN echo "export JAVA_HOME=/usr/lib/jvm/default" >> "/root/.zshrc"

RUN echo "/bin/zsh" | chsh

CMD [ "zsh" ]