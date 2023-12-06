FROM ubuntu:22.04

RUN apt-get update && apt-get install sudo
RUN apt-get update && apt-get install -y ansible

COPY main.yml /ansible/main.yml

RUN ansible-playbook /ansible/main.yml

