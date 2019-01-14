#!/usr/bin/env bash

yum update -y; yum upgrade -y
yum install -y git wget curl zlib zip unzip openssl which

wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm

yum update -y; yum upgrade -y

yum groupinstall -y 'Development Tools'

yum install  --enablerepo=epel -y lua lua-devel lua-sec lua-posix lua-filesystem tcl

wget https://sourceforge.net/projects/lmod/files/Lmod-7.8.tar.bz2

tar -xvf Lmod-7.8.tar.bz2 && \
    cd Lmod-7.8 && \
    ./configure && \
    make install

