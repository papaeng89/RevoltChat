#!/bin/bash

export root="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
export SERVICE_DOMAIN=[DOMAIN NAME]
export SERVICE_NAME=[HOSTNAME]
export SERVICE_ADDRESS=$SERVICE_NAME.$SERVICE_DOMAIN
export SERVICE_IP=[LOCAL ADDRESS IP]
export LETSENCRYPT_MAIL=[MAIL LETSENCRYPT]
export PUBLIC_IP=[PUBLIC ADDRESS IP]

source $root/lib.sh
__generate_service

__copy_nginx

if [ -f "$root/keys.env" ]; then
    source $root/keys.env
    VAPID_PRIVATE=$(echo $VAPID_PRIVATE_B64 | base64 --decode)
else
    VORTEX_TOKEN=$(__random_token)
    echo VORTEX_TOKEN=$VORTEX_TOKEN >> $root/keys.env

    VAPID_PRIVATE=$(openssl ecparam -name prime256v1 -genkey)
    VAPID_PRIVATE_B64=$(echo $"$VAPID_PRIVATE" | base64 | tr -d '\n')
    echo VAPID_PRIVATE_B64=$VAPID_PRIVATE_B64 >> $root/keys.env
fi

vapidPrivateB64=$(echo $"$VAPID_PRIVATE" | base64 | tr -d '\n')
vapidPublicB64=$(echo $"$VAPID_PRIVATE" | openssl ec -outform DER | tail -c 65 | base64 | tr '/+' '_-' | tr -d '\n')

sed -i \
    -e "s/\${VORTEX_TOKEN}/${VORTEX_TOKEN}/g" \
    -e "s/\${VAPID_PRIVATE_KEY}/${vapidPrivateB64}/g" \
    -e "s/\${VAPID_PUBLIC_KEY}/${vapidPublicB64}/g" \
    -e "s/\${PUBLIC_IP}/${PUBLIC_IP}/g" \
    .env

docker-compose up -d
