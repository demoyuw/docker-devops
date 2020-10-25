#! /bin/bash

for ((i=11; i<=12; i++))
do
    gcloud compute --project=devops-cicd-3 instances create docker-devops-vm2-$i \
    --zone=us-central1-a --machine-type=n1-standard-1 --subnet=default --network-tier=PREMIUM \
    --maintenance-policy=MIGRATE --service-account=801863942905-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --tags=http-server,https-server --image=ubuntu-1604-xenial-v20201014 --image-project=ubuntu-os-cloud \
    --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=docker-devops-vm2-$i
done
