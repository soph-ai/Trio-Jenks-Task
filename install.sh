#!/bin/bash 

sudo apt-get update
#Install Docker 
curl https://get.docker.com | sudo bash
sudo usermod -aG docker jenkins 

#Install docker-compose 
sudo apt-get install -y curl jq
# set which version to download (latest)
version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
# download to /usr/local/bin/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# make the file executable
sudo chmod +x /usr/local/bin/docker-compose

echo $DOCKER_PASSWORD | docker login --username soph337 --password-stdin 