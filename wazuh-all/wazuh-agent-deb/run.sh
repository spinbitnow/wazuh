#!/bin/sh
export PROJECT_ID=$(gcloud config get-value project)
docker build -t gcr.io/$PROJECT_ID/wazdeb:latest .
docker push gcr.io/$PROJECT_ID/wazdeb:latest

kubectl create deployment wazdeb --image=gcr.io/$PROJECT_ID/wazdeb:latest

