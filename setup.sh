#!/bin/bash
# setup folders
mkdir app
mkdir app/certificates
mkdir app/db_data
mkdir app/db_data/postgres
mkdir app/db_data/couchDB
mkdir app/data
mkdir app/data/images_public
mkdir app/data/images_private
mkdir app/settings
mkdir app/settings/image-compression

# get repos
mkdir src
cd src
git clone git@github.com:e-ducation-bg/node-image-compression.git
git clone git@github.com:e-ducation-bg/jwt_issuer_public.git
git clone git@github.com:e-ducation-bg/microservice-reverse-proxy.git
git clone git@github.com:e-ducation-bg/flask-permission-manager.git
git clone git@github.com:e-ducation-bg/frontend.git
git clone git@github.com:e-ducation-bg/api.git
cd ..

# copy relevant conf files
cp -a ./src/node-image-compression/misc/. app/settings/image-compression

# generate .crt file needed for nginx
openssl req -x509 -nodes -newkey rsa:4096 -keyout app/certificates/private.key -out app/certificates/public.crt
# generate .pem file needed for jwt
openssl x509 -pubkey -noout -in app/certificates/public.crt  > app/certificates/public.pem

# build images
sudo docker-compose build --no-cache
sudo docker-compose up