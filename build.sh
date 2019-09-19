#! /bin/bash

./rucio-common-cfg/propagate-config.sh

cp ./CA-stuff/rucio-fts3.crt.pem ./rucio-fts3
cp ./CA-stuff/rucio-fts3.key.pem ./rucio-fts3
cp ./CA-stuff/stardonkey-CA.crt ./rucio-fts3

docker-compose build