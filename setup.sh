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
git clone git@github.com:justitsi/node-image-compression.git
git clone git@github.com:justitsi/jwt_issuer_public.git
git clone git@github.com:justitsi/microservices-frontend.git
git clone git@github.com:justitsi/microservice-reverse-proxy.git
cd ..

# copy relevant conf files
cp -a ./src/node-image-compression/misc/. app/settings/image-compression

# generate .crt file needed for nginx
openssl req -x509 -nodes -newkey rsa:4096 -keyout app/certificates/private.key -out app/certificates/public.crt
# generate .pem file needed for jwt
openssl x509 -pubkey -noout -in app/certificates/public.crt  > app/certificates/public.pem

# build images
docker-compose build