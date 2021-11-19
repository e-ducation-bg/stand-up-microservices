#!/bin/bash
# Update repos
cd src
# delete repos
rm -rf node-image-compression
rm -rf api
rm -rf frontend
rm -rf jwt_issuer_public
rm -rf microservice-reverse-proxy
rm -rf flask-permission-manager

# re-download them
git clone git@github.com:e-ducation-bg/node-image-compression.git
git clone git@github.com:e-ducation-bg/jwt_issuer_public.git
git clone git@github.com:e-ducation-bg/microservice-reverse-proxy.git
git clone git@github.com:e-ducation-bg/flask-permission-manager.git
git clone git@github.com:e-ducation-bg/frontend.git
git clone git@github.com:e-ducation-bg/api.git

# return to main dir
cd ..

# Update images
sudo docker-compose build --no-cache --parallel
sudo docker-compose up