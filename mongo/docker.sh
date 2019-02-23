#!/bin/bash

# Variables
IMAGE="mongo:4.0"
CONTAINER="mongodb"

docker volume create ${CONTAINER}_data

docker pull $IMAGE

docker stop $CONTAINER

docker rm $CONTAINER

docker run --name=$CONTAINER -d -p 27017:27017 \
	-v ${CONTAINER}_data:/data/db \
	$IMAGE

docker ps -f "name=${CONTAINER}"