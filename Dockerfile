FROM ubuntu:22.04

RUN apt-get update

# Dependencies for rootfs build
RUN apt-get install -y debootstrap
RUN apt-get install -y qemu-system-arm qemu-system qemu-utils

# Dependencies for kernel build
RUN apt-get install -y \
	gcc-aarch64-linux-gnu \
	gcc \
	binutils \
	bc \
	flex \
	bison \
	make \
	libc6-dev \
	libssl-dev \
	device-tree-compiler \
	util-linux \
	kmod \
	e2fsprogs \
	xz-utils

# Additional tools
RUN apt-get install -y \
	g++-aarch64-linux-gnu \
	g++ \
	tar \
	gzip \
	cpio \
	udev

# Filesystem
RUN apt-get install -y \
	parted \
	dosfstools \
	fdisk

RUN apt-get clean

RUN useradd builder
RUN usermod -aG sudo builder
USER builder

WORKDIR /home/builder
