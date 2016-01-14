#!/usr/bin/env bash

apt-get update && apt-get install -y \
    unzip \
    curl \
    zookeeper \
    zsh

# PACKER_IMAGE=packer_0.8.6_linux_amd64.zip
# wget --quiet https://dl.bintray.com/mitchellh/packer/$PACKER_IMAGE
# unzip -o $PACKER_IMAGE -d /usr/local/packer
# rm $PACKER_IMAGE
# echo 'export PATH=$PATH:/usr/local/packer' >> .bashrc

echo 'DOCKER_OPTS="${DOCKER_OPTS} -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"' >> /etc/default/docker
service docker restart

