#!/bin/bash

sudo apt update -y

# create user 
sudo useradd ansibleadmin -s /bin/bash -m -d /home/ansibleadmin

# passwordless sudo
sudo echo "ansibleadmin ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansibleadmin > /dev/null

# authorized keys
sudo mkdir -p /home/ansibleadmin/.ssh
echo "authorized keys" | sudo tee /home/ansibleadmin/.ssh/authorized_keys > /dev/null