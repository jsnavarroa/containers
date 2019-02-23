#!/bin/bash

# Variables
IMAGE="portainer/portainer:latest"
CONTAINER="portainer"

docker volume create ${CONTAINER}_data

docker pull $IMAGE

docker stop $CONTAINER

docker rm $CONTAINER

docker run --name=$CONTAINER -d -p 9900:9000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v ${CONTAINER}_data:/data \
	$IMAGE

