#!/bin/bash

# Variables
IMAGE="portainer/portainer:latest"
CONTAINER="portainer"

docker volume create ${CONTAINER}_data

docker pull portainer/portainer:latest

docker stop $CONTAINER

docker rm $CONTAINER

docker run --name=$CONTAINER -d -p 9000:9000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v ${CONTAINER}_data:/data \
	$IMAGE

