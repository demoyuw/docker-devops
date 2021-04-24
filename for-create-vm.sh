#! /bin/bash

for ((i=47; i<=48; i++))
do
    gcloud compute --project=turnkey-cocoa-285018 instances create docker-devops-vm1-$i \
    --zone=us-east1-b --machine-type=e2-standard-2 --subnet=default --network-tier=PREMIUM \
    --maintenance-policy=MIGRATE --service-account=177980045088-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --tags=http-server,https-server --image=ubuntu-1604-xenial-v20210416 --image-project=ubuntu-os-cloud \
    --boot-disk-size=20GB --boot-disk-type=pd-standard --boot-disk-device-name=docker-devops-vm2-$i
done
