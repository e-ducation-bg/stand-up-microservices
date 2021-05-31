#!/bin/bash
# Update repos
cd src/node-image-compression
git pull
cd ../jwt_issuer_public
git pull
cd ../microservices-frontend
git pull
cd ../microservice-reverse-proxy
git pull

# return to main dir
cd ../..

# Update images
sudo docker-compose build
sudo docker-compose push