#!/bin/bash

PROJECT="$(gcloud projects describe \
    $(gcloud config get-value core/project -q) --format='get(projectNumber)')"

gcloud projects add-iam-policy-binding $PROJECT \
    --member=serviceAccount:$PROJECT@cloudbuild.gserviceaccount.com \
    --role=roles/container.developer

kubectl autoscale deployment nginx --min 1 --max 5 --cpu-percent 1

gcloud container builds list --ongoing


kubectl autoscale deployment nginx --min 1 --max 5 --cpu-percent 1
watch 'kubectl get hpa'
watch 'kubectl top pods --containers | sort'
