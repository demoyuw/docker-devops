#!/bin/bash

WORK_DIR=/home/demoyuw
LOGFILE=$WORK_DIR/log/rancher_install.log
mkdir $WORK_DIR/log
touch $LOGFILE

mkdir $WORK_DIR/rancher &>> $LOGFILE
chmod 755 $WORK_DIR/rancher &>> $LOGFILE
docker run -d --restart=unless-stopped -p 10080:80 -p 10443:443 -v $WORK_DIR/rancher:/var/lib/rancher rancher/rancher &>> $LOGFILE
