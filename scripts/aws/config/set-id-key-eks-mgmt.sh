#!/bin/bash

# create aws ID and Secret
AWSID=$1
AWSSECRET=$2

aws configure set aws_access_key_id ${AWSID}
aws configure set aws_secret_access_key ${AWSSECRET}