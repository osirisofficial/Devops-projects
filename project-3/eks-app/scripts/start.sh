#!/bin/bash

set -e

#authenticate docker with ecr
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 783764591716.dkr.ecr.us-east-1.amazonaws.com

#run container
docker run -d -p 8080:80 783764591716.dkr.ecr.us-east-1.amazonaws.com/eks-app:latest  --name=netflix