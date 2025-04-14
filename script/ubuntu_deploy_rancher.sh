#!/bin/bash

WORK_DIR=/home/`logname`

apt-get update
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
usermod -aG docker `logname`
newgrp docker

mkdir -p $WORK_DIR/rancher
chmod 755 $WORK_DIR/rancher
docker run -d --privileged --restart=unless-stopped -p 10080:80 -p 10443:443 -v $WORK_DIR/rancher:/var/lib/rancher rancher/rancher:stable
