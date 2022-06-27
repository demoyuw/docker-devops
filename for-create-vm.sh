#! /bin/bash

for ((i=9; i<=12; i++))
do
    gcloud compute --project=cedar-card-352414 instances create gitlab-cicd-vm2-$i \
    --zone=us-west1-b --machine-type=e2-standard-2 --subnet=default --network-tier=PREMIUM \
    --maintenance-policy=MIGRATE --service-account=293756706705-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --tags=http-server,https-server --image=ubuntu-2004-focal-v20220615 --image-project=ubuntu-os-cloud \
    --boot-disk-size=40GB --boot-disk-type=pd-standard --boot-disk-device-name=gitlab-cicd-vm2-$i
done
