#!/usr/bin/env bash

## https://raw.githubusercontent.com/nyuad-cgsb/training-aws/feature/user-management/pre_install_scripts/install_all_the_things.sh

wget https://raw.githubusercontent.com/nyuad-cgsb/training-aws/feature/user-management/pre_install_scripts/install_lmod.sh
chmod 777 install_lmod.sh

wget https://raw.githubusercontent.com/nyuad-cgsb/training-aws/feature/user-management/pre_install_scripts/create_users.sh
chmod 777 create_users.sh

wget https://raw.githubusercontent.com/nyuad-cgsb/training-aws/feature/user-management/pre_install_scripts/create_users_file.py
chmod 777 create_users_file.py

./install_lmod.sh
./create_users.sh
