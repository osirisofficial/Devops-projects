#!/bin/sh

docker rm -f $(docker ps -aq)

docker image rm 783764591716.dkr.ecr.us-east-1.amazonaws.com/eks-app:latest