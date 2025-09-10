#!/bin/bash

sudo apt update -y

#install ansible
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt update -y
sudo apt install ansible -y

# create user
sudo useradd devopsadmin -s /bin/bash -m -d /home/devopsadmin

# passwordles sudo for devopsadmin
echo "devopsadmin ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/devopsadmin > /dev/null

# change ownership of /etc/ansible to devopsadmin
sudo chown -R devopsadmin:devopsadmin /etc/ansible

# create ssh key for devops admin
cd /home/devopsadmin
sudo -u devopsadmin ssh-keygen -t ecdsa -b 521 -f /home/devopsadmin/.ssh/id_ecdsa -q -N ""