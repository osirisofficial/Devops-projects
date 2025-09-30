#!/bin/bash

sudo apt update -y

# install ansible
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

# creating user
sudo useradd devopsadmin -s /bin/bash -m -d /home/devopsadmin

# passwordless sudo
sudo echo "devopsadmin ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/devopsadmin > /dev/null

#change ownership of ansible
sudo chown -R devopsadmin:devopsadmin /etc/ansible

#generate ssh key 
cd /home/devopsadmin
sudo -u devopsadmin ssh-keygen -t ecdsa -b 521 -f /home/devopsadmin/.ssh/id_ecdsa -q -N ""