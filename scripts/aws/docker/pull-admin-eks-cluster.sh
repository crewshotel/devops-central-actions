#!/bin/bash

# create variables
DOCKERSUB=$1
REGION=$2
CLUSTER=$3

DOCKER_REGISTRY=${DOCKERSUB}.dkr.ecr.${REGION}.amazonaws.com

DOCKER_IMAGE_FULL=${DOCKER_REGISTRY}/admin-${CLUSTER}:latest

# log in to aws ECR
aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${DOCKER_REGISTRY}

# pull docker image
docker pull ${DOCKER_IMAGE_FULL}

# log out of aws ECR
docker logout ${DOCKER_REGISTRY}