#!/usr/bin/env bash

#######################################################################################################################
# Mount storage necessary for /scratch and /apps
#######################################################################################################################

sudo yum install -y amazon-efs-utils

sudo mkdir -p /apps
sudo mkdir -p /scratch

sudo mount -t efs fs-fe6a231f:/ /scratch
sudo mount -t efs fs-0bc69dea:/ /apps