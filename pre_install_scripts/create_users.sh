#!/usr/bin/env bash

## This must be run as root, or as a user with elevated permissions

set -x -e

#export ANACONDA3_BASE=/home/ec2-user/.local/anaconda3
#export PATH=${ANACONDA3_BASE}/bin:$PATH

python ./create_users_file.py

newusers new-users.txt
