#!/bin/bash
USERNAME="h"
GLUSTER_FS_DISK="/dev/sdb"

sudo add-apt-repository ppa:gluster/glusterfs-9 -y
sudo apt update
sudo apt upgrade -y

# Open machine ports for networking
# SSH
sudo ufw allow 22
# Docker swarm
sudo ufw allow 2376
sudo ufw allow 2377
sudo ufw allow 7946
sudo ufw allow 4789
# Gluster storage
sudo ufw allow 5667

# Install ssh server if missing
sudo apt install openssh-server -y

# Install Docker as deb because of snap version swarm storage
sudo snap remove docker
sudo apt install docker.io docker-compose -y

# Install glusterfs storage
sudo apt-get install glusterfs-server attr -y

# setup gluster and docker services for autostart
sudo systemctl enable glusterd.service
sudo systemctl enable docker.service

# setup glusterfs partition
mkdir /home/$USERNAME/appData
sudo chown $USERNAME /home/$USERNAME/appData

sudo mkfs.xfs $GLUSTER_FS_DISK
echo $GLUSTER_FS_DISK /home/$USERNAME/appData xfs defaults 0 0 >> /etc/fstab
sudo mount -a

mkdir /home/$USERNAME/appData/brick
sudo chown $USERNAME /home/$USERNAME/appData/brick

# Install glusterfs docker plugin
sudo docker plugin install --alias glusterfs trajano/glusterfs-volume-plugin --grant-all-permissions --disable

# Reboot to finalize installations
sudo reboot