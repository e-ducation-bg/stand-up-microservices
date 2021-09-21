#!/bin/bash
# Update repos
cd src/node-image-compression
git pull
cd ../jwt_issuer_public
git pull
cd ../frontend
git pull
cd ../microservice-reverse-proxy
git pull
cd ../flask-permission-manager
git pull
cd ../api
git pull

# return to main dir
cd ../..

# Update images
sudo docker-compose build --no-cache --parallel
sudo docker-compose up