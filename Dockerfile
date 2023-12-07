FROM ubuntu:22.04

# Docker variables
ARG ADMIN=admin
ARG PLAYBOOK=server_setup.yml
ARG HOST_USER=$USER
ENV HOST_USER=$HOST_USER
ARG CONTAINER_HOME=$HOME
ENV CONTAINER_HOME=$CONTAINER_HOME

# Install base dependencies
RUN apt-get update && apt-get install sudo
# RUN apt-get update && apt-get install apt-utils
RUN apt-get update && apt-get install -y ansible
# RUN apt-get update && apt-get install -y python3-pip
# RUN pip3 --no-cache-dir install --upgrade awscli

# Setup admin user
RUN adduser --gecos "" $ADMIN
RUN passwd -d $ADMIN
RUN usermod -aG sudo $ADMIN

# Switch to admin user
USER $ADMIN
RUN echo $ADMIN >&2
RUN echo $HOME >&2
RUN echo $CONTAINER_HOME >&2
WORKDIR /home/admin/
# $HOME
# $CONTAINER_HOME

COPY PLAYBOOK /ansible/server_setup.yml
COPY /home/$HOST_USER/.ssh/authorized_keys $HOME/.ssh/authorized_keys

# RUN ansible-playbook /ansible/main.yml
