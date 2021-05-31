#!/bin/bash
sudo ufw allow 5000
sudo docker service create --name registry --publish published=5000,target=5000 registry:2
