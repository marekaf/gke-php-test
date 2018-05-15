PROJECT="$(gcloud projects describe \
    $(gcloud config get-value core/project -q) --format='get(projectNumber)')"

config:
	gcloud projects add-iam-policy-binding $PROJECT \
 	   --member=serviceAccount:${PROJECT}@cloudbuild.gserviceaccount.com \
   	   --role=roles/container.developer

autoscale:
	kubectl autoscale deployment nginx --min 1 --max 5 --cpu-percent 1

container-builder:
	gcloud container builds list --ongoing

hpa-status:
	watch 'kubectl get hpa'
top:
	watch 'kubectl top pods --containers | sort'
