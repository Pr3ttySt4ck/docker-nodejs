FROM debian:jessie

### Create development user ###
RUN useradd -m sailor -s /bin/bash

### Install c++ compiler ###
RUN apt-get update && \
    apt-get install -y build-essential libssl-dev curl

### Change user ###
USER sailor

### Fetch nvm package ###
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.13.1/install.sh | bash

### Install node default version ###
ENV NVM_DIR /home/sailor/.nvm

RUN . /home/sailor/.bashrc && \
    . /home/sailor/.nvm/nvm.sh && \
    nvm install v0.10.31 && \
    nvm alias default 0.10.31

ENV PATH /home/sailor/.nvm/v0.10.31/bin/node:/home/sailor/.nvm:$PATH

WORKDIR /home/sailor/
CMD tail -f /var/log/lastlog
