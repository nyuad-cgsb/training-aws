FROM centos:7

RUN yum update -y; yum upgrade -y
RUN yum install -y git wget curl zlib zip unzip openssl which

RUN wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -ivh epel-release-latest-7.noarch.rpm

RUN yum update -y; yum upgrade -y

RUN yum groupinstall -y 'Development Tools'

RUN yum install -y lua lua-devel lua-sec lua-posix lua-filesystem tcl

RUN wget https://sourceforge.net/projects/lmod/files/Lmod-7.8.tar.bz2

RUN tar -xvf Lmod-7.8.tar.bz2 && \
    cd Lmod-7.8 && \
    ./configure && \
    make install

## Have to somehow source the lmod
## Probably need to just add it to all the users ~/.bashrc
#RUN cp /usr/local/lmod/lmod/init/bash /etc/profile.d/lmod.sh

RUN useradd -ms /bin/bash ebuser
USER ebuser
WORKDIR /home/ebuser

## To actually be able to use modules source /usr/local/lmod/lmod/init/bash

#RUN wget https://raw.githubusercontent.com/nyuad-cgsb/nyuad-hpc-module-configs/master/scripts/deploy_gencore_modules.sh
#RUN chmod 777 deploy_gencore_modules.sh
#RUN chmod 777 install_easybuild.sh

RUN echo "alias l='ls -lah'" >> .bashrc
RUN echo "source /usr/local/lmod/lmod/init/bash" >> .bashrc

COPY install_easybuild.sh ./
RUN bash -c ./install_easybuild.sh
