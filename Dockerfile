FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y \
    sudo \
    binutils \
    build-essential \
    golang \
    sysstat \
    python3-matplotlib \
    python3-pil \
    fonts-takao \
    fio \
    qemu-kvm \
    virt-manager \
    libvirt-clients \
    virtinst \
    jq \
    docker.io \
    containerd \
    libvirt-daemon-system

# add sudo user
RUN groupadd -g 1000 developer && \
    useradd  -g      developer -G sudo -m -s /bin/bash mix && \
    echo 'mix:mix' | chpasswd

RUN echo 'Defaults visiblepw'             >> /etc/sudoers
RUN echo 'mix ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER mix

RUN sudo adduser `id -un` libvirt
RUN sudo adduser `id -un` libvirt-qemu
RUN sudo adduser `id -un` kvm
