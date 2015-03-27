FROM ubuntu
MAINTAINER Mark Dunning<mark.dunning@cruk.cam.ac.uk>

RUN sudo apt-get update
RUN sudo apt-get install -y git
#RUN git clone https://github.com/swcarpentry/shell-novice.git

RUN sudo apt-get install -y nano vim wget

RUN useradd nelle -d /users/nelle -p elephant
RUN useradd imhotep -d /users/imhotep
RUN useradd larry -d /users/larry
RUN useradd dru -d /users/dru
RUN useradd gorgon -d /users/gorgon

RUN mkdir -p /users/imhotep
RUN mkdir -p /users/larry
RUN mkdir -p /users/dru
RUN mkdir -p /users/gorgon 
RUN mkdir -p /users/nelle

RUN mkdir -p /data/backup
RUN touch /data/access.log
RUN touch /data/hardware.cfg
RUN touch /data/network.cfg


RUN chown -R nelle /users/nelle
RUN chown -R imhotep /users/imhotep
RUN chown -R larry /users/larry
RUN chown -R dru /users/dru
RUN chown -R gorgon /users/gorgon

RUN chmod 711 /users/nelle
RUN chmod 711 /users/imhotep
RUN chmod 711 /users/larry
RUN chmod 711 /users/dru
RUN chmod 711 /users/gorgon

RUN git clone https://github.com/swcarpentry/shell-novice.git
RUN scp -r shell-novice/filesystem/nelle /users/
RUN rm -r shell-novice

USER nelle

WORKDIR /users/nelle

