#!/bin/bash

sudo apt update -y

# create user 
sudo useradd ansibleadmin -s /bin/bash -m -d /home/ansibleadmin

# passwordless sudo
echo "ansibleadmin ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansibleadmin > /dev/null

# authorized keys
sudo  mkdir -p /home/ansibleadmin/.ssh
echo "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBADBPfvbDs84NYf4yjlNclyIVDC08WvYs6bmGen2Gnx4euOWPesY1LRIrREP0edhhXZrTgNcBZ2eNG1D8+6P/DetIAEXjsadPmTuDldMF3caLWJ2qQjYWDHxGTZqTJjk5YyklHkacNknG4Nz8RA1Y+FSZdWIAqyCm1Vjv6mlxQVXNHI7Bg== devopsadmin@ip-10-0-1-18" | sudo  tee /home/ansibleadmin/.ssh/authorized_keys > /dev/null

#fixing ownership and permission
sudo chown -R ansibleadmin:ansibleadmin /home/ansibleadmin/.ssh/
sudo chmod 700 /home/ansibleadmin/.ssh
sudo chmod 600 /home/ansibleadmin/.ssh/authorized_keys

