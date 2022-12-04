#! /bin/bash

for ((i=5; i<=8; i++))
do
    gcloud compute --project=nifty-altar-355608 instances create devops-cicd-vm2-$i \
    --zone=us-central1-a --machine-type=e2-standard-2 --subnet=default --network-tier=PREMIUM \
    --maintenance-policy=MIGRATE --service-account=720047108270-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --tags=http-server,https-server --image=ubuntu-2004-focal-v20221121 --image-project=ubuntu-os-cloud \
    --boot-disk-size=40GB --boot-disk-type=pd-standard --boot-disk-device-name=devops-cicd-vm2-$i
done
