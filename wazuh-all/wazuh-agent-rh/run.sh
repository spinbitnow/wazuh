#!/bin/sh
export PROJECT_ID=$(gcloud config get-value project)
docker build -t gcr.io/$PROJECT_ID/wazubi8min:latest .
docker push gcr.io/$PROJECT_ID/wazubi8min:latest

kubectl create deployment wazubi8min --image=gcr.io/$PROJECT_ID/wazubi8min:latest

