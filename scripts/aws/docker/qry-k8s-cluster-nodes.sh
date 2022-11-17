#!/bin/bash

# create variables
DOCKERSUB=$1
REGION=$2
CLUSTER=$3

DOCKER_REGISTRY=${DOCKERSUB}.dkr.ecr.${REGION}.amazonaws.com

DOCKER_IMAGE_FULL=${DOCKER_REGISTRY}/admin-${CLUSTER}:latest

# list all docker images
docker image ls -a

# start docker image
docker run -d -ti --name ${CLUSTER} --entrypoint /bin/bash ${DOCKER_IMAGE_FULL}

# list docker images
docker ps -a

# run kubectl in container to return k8s nodes
docker exec -ti ${CLUSTER} kubectl get nodes

# stop and remove container
docker container stop ${CLUSTER}
docker rm container ${CLUSTER}
docker ps -a

# remove admin docker image
docker image rm${DOCKER_IMAGE_FULL} -f

# list all docker images
docker image ls -a