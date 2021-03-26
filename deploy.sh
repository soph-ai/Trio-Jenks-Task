#!/bin/bash

# Create network 
docker network create my-network-trio

# Create db volume 
docker volume create dbvolume

# Create images 
docker build -t trio-db db 
docker build -t trio-app flask-app

# Run DB container 
docker run -d --network my-network-trio --name mysql --volume dbvolume:/var/lib/mysql trio-db

# Run Flash app 
docker run -d --network my-network-trio --name flask-app trio-app

# Run NGINX container 
docker run -d --network my-network-trio --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf -p 80:80 --name nginx nginx:alpine