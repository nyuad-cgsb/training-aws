FROM centos:7

COPY ./install_lmod.sh ./
RUN bash -c ./install_lmod.sh

## Have to somehow source the lmod
## Probably need to just add it to all the users ~/.bashrc
#RUN cp /usr/local/lmod/lmod/init/bash /etc/profile.d/lmod.sh

RUN useradd -ms /bin/bash ec2-user
USER ec2-user
WORKDIR /home/ec2-user

RUN echo "alias l='ls -lah'" >> .bashrc
## To actually be able to use modules source /usr/local/lmod/lmod/init/bash
RUN echo "source /usr/local/lmod/lmod/init/bash" >> .bashrc

COPY install_easybuild.sh ./
RUN bash -c ./install_easybuild.sh

USER root

COPY create_users_file.py ./
COPY create_users.sh ./
RUN bash -c ./create_users.sh