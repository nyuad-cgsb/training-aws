#!/usr/bin/env bash

#######################################################################################################################
# Mount storage necessary for /scratch and /apps
#######################################################################################################################

sudo mkdir -p /apps
sudo mkdir -p /scratch

sudo mount -t efs fs-1960cef8:/ /scratch
sudo mount -t efs fs-6a45eb8b:/ /apps
