#!/bin/bash

#PUBLIC_IP=$(curl -sS ifconfig.me)

function __replace () {
    sed \
        -e "s/\${IP}/${SERVICE_IP}/g" \
        -e "s/\${ADDRESS}/${SERVICE_ADDRESS}/g" \
        -e "s/\${DOMAIN}/${SERVICE_DOMAIN}/g" \
        -e "s/\${PUBLIC_IP}/${PUBLIC_IP}/g" \
        -e "s/\${LETSENCRYPT_MAIL}/${LETSENCRYPT_MAIL}/g" \
        $@
}

function __generate_service () {
    __replace template.env > .env
    __replace docker-compose.template.yml > docker-compose.yml
    __replace nginx.template.conf > nginx.conf
}

function __random_token () {
    head -c 20 /dev/urandom | sha1sum | egrep -o '[a-z0-9]+'
}

function __copy_nginx () {
    cp $root/nginx.conf $root/configs/nginx/nginx.conf
}

#export services=$(cat $root/services.txt)
