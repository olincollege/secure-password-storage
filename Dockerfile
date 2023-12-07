FROM ubuntu:22.04

RUN apt-get update && apt-get install sudo
RUN apt-get update && apt-get install -y ansible
RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip3 --no-cache-dir install --upgrade awscli

COPY main.yml /ansible/main.yml
COPY authorized_keys authorized_keys

RUN ansible-playbook /ansible/main.yml

