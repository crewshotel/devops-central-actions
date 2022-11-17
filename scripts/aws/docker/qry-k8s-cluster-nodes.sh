#!/bin/bash

# create variables
DOCKERSUB=$1
REGION=$2
CLUSTER=$3

DOCKER_REGISTRY=${DOCKERSUB}.dkr.ecr.${REGION}.amazonaws.com

DOCKER_IMAGE_FULL=${DOCKER_REGISTRY}/admin-${CLUSTER}:latest

# start docker image
docker run -d -ti --name ${CLUSTER} --entrypoint /bin/bash ${DOCKER_IMAGE_FULL}

# list docker images
docker ps -a