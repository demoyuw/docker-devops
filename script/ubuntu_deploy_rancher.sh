#!/bin/bash

WORK_DIR=/home/`logname`

mkdir -p $WORK_DIR/rancher
chmod 755 $WORK_DIR/rancher
docker run -d --privileged --restart=unless-stopped -p 10080:80 -p 10443:443 -v $WORK_DIR/rancher:/var/lib/rancher rancher/rancher:stable
