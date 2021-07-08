# Wazuh and GKE
# what we want to do:
- learn together about Wazuh
- how to install Wazuh in GCP ( in GKE )
- create container with Wazuh client inside and connect to GKE
# steps :

use GCP cloud shell

git clone https://github.com/spinbitnow/wazuh.git 

cd wazuh-all

./setupenv

to enable service container, registry and dns setup GKE and and get credentials, will take 5- 10 mins

cd wazuh-kubernetes

./deploy

to deploy wazuh server in GKE, will take 5- 10 mins, need to wait until every service is ready, nothing error or pending

check with :

kubectl get service -n wazuh

cd ..

./createprivatezone

to create private zone, to make agent able to detect server name, need to wait 5-10 mins

cd wazuh-agent-rh-ubi-std/

sh run.sh

to create docker image, push to GCR, deploy one container for shows agent works
note : this is using UBI8 STD distro

cd ..

cd wazuh-agent-rh/

sh run.sh

to create docker image, push to GCR, deploy one container for shows agent works 
note : this is using UBI8 MIN distro


cd wazuh-agent-deb/

sh run.sh

to create docker image, push to GCR, deploy one container for shows agent works 
note : this is using DEB distro

to delete cluster :
gcloud container clusters delete security-wazuh --zone=us-east1-c 
