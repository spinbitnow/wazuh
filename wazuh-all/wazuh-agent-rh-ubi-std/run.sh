#!/bin/sh
export PROJECT_ID=$(gcloud config get-value project)
docker build -t gcr.io/$PROJECT_ID/wazubi8:latest .
docker push gcr.io/$PROJECT_ID/wazubi8:latest

kubectl create deployment wazubi8 --image=gcr.io/$PROJECT_ID/wazubi8:latest

