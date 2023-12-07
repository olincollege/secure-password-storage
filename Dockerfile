FROM ubuntu:22.04

# Docker variables
ARG ADMIN=admin
ARG PLAYBOOK=server_setup.yml
ARG HOST_USER=$USER
ENV HOST_USER=$HOST_USER

# Setup admin user
RUN adduser --gecos "" $ADMIN
RUN passwd -d $ADMIN
RUN usermod -aG sudo $ADMIN

# Install base dependencies
RUN apt-get update && apt-get install sudo
RUN apt-get update && apt-get install -y ansible
RUN apt-get update && apt-get install -y python3-pip
RUN pip3 --no-cache-dir install --upgrade awscli

# Switch to admin user
USER $ADMIN
WORKDIR $HOME
# /home/admin/

COPY PLAYBOOK /ansible/server_setup.yml
COPY /home/$HOST_USER/.ssh/authorized_keys $HOME/.ssh/authorized_keys

# RUN ansible-playbook /ansible/main.yml
