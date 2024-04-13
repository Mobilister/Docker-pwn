# Använd ubuntu:latest som basbild
FROM ubuntu:latest

# Undvik frågor under installationen genom att sätta denna miljövariabel
ENV DEBIAN_FRONTEND=noninteractive

# Installera tzdata och andra paket utan interaktiva prompter
RUN dpkg --add-architecture i386 && \
    apt-get -y update && \
    apt install -y \
    libc6:i386 \
    libc6-dbg:i386 \
    libc6-dbg \
    lib32stdc++6 \
    g++-multilib \
    cmake \
    ipython3 \
    vim \
    net-tools \
    iputils-ping \
    libffi-dev \
    libssl-dev \
    python3-dev \
    python3-pip \
    build-essential \
    ruby \
    ruby-dev \
    tmux \
    strace \
    ltrace \
    nasm \
    wget \
    gdb \
    gdb-multiarch \
    netcat \
    socat \
    git \
    patchelf \
    gawk \
    file \
    python3-distutils \
    bison \
    rpm2cpio cpio \
    zstd \
    zsh \
    curl \
    tzdata --fix-missing && \
    rm -rf /var/lib/apt/list/*

RUN version=$(curl -s https://api.github.com/repos/radareorg/radare2/releases/latest | grep -P '"tag_name": "(.*)"' -o| awk '{print $2}' | awk -F"\"" '{print $2}') && \
    wget https://github.com/radareorg/radare2/releases/download/${version}/radare2_${version}_amd64.deb && \
    dpkg -i radare2_${version}_amd64.deb && rm radare2_${version}_amd64.deb

RUN python3 -m pip config set global.index-url https://pypi.org/simple && \
    python3 -m pip config set global.trusted-host https://pypi.org && \
    python3 -m pip install -U pip && \
    python3 -m pip install --no-cache-dir \
    ropgadget \
    z3-solver \
    smmap2 \
    apscheduler \
    ropper \
    unicorn \
    keystone-engine \
    capstone \
    angr \
    pebble \
    r2pipe

RUN gem install one_gadget seccomp-tools && rm -rf /var/lib/gems/2.*/cache/*

RUN git clone --depth 1 https://github.com/pwndbg/pwndbg && \
    cd pwndbg && chmod +x setup.sh && ./setup.sh

RUN python3 -m pip install --no-cache-dir pwntools=="4.12.0"
   
# Konfigurera tidszonen
RUN ln -fs /usr/share/zoneinfo/Europe/Stockholm /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Rensa upp APT när det inte längre är nödvändigt
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Ställ in arbetsskatalog
WORKDIR /work/pwn

# Definiera standardkommandot eller startpunkt
CMD ["/bin/bash"]
