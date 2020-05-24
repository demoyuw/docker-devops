#! /bin/bash

for ((i=2; i<=2; i++))
do
    gcloud compute --project=k8s-class-1 instances create docker-devops-$i \
    --zone=us-west1-b --custom-cpu 4 --custom-memory 6 --subnet=default --network-tier=PREMIUM \
    --maintenance-policy=MIGRATE --service-account=29989274475-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --tags=http-server,https-server --image=ubuntu-1604-xenial-v20200521 --image-project=ubuntu-os-cloud \
    --boot-disk-size=20GB --boot-disk-type=pd-standard --boot-disk-device-name=docker-devops-$i
done
