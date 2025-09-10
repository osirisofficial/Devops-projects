#!/bin/bash

sudo apt update -y

# create user 
sudo useradd ansibleadmin -s /bin/bash -m -d /home/ansibleadmin

#password less sudo access for ansibleadmin
echo "ansibleadmin ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansibleadmin > /dev/null

# authorized keys
sudo mkdir -p /home/ansibleadmin/.ssh
echo "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGVqI0deSCEGp/zd2Mv+hXxB7SRYn9uJ9vDsTs3mfEftnpcFjlpFuqrthK7i75WULOZbnemtFdZIhp36JqSRW0bZgHsnCb433BFc0Xjlhz3cg0IYmTF1WQHL0JPNfoYYXS6VlE/my7dUjhuhljg0B3F8QsH+CZWcFwVIAPE+xGXUMeQSw== devopsadmin@ip-10-0-1-18" | sudo tee /home/ansibleadmin/.ssh/authorized_keys > /dev/null


# fix permissions
sudo chown -R ansibleadmin:ansibleadmin /home/ansibleadmin/.ssh
sudo chmod 700 /home/ansibleadmin/.ssh
sudo chmod 600 /home/ansibleadmin/.ssh/authorized_keys