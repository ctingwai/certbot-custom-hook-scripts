#!/bin/bash

source ./config.sh

# Create TXT record
echo "Creating TXT zone record for $CREATE_DOMAIN on domain ${DOMAIN}"
result=$(curl -s -H"Authorization: cpanel $USERNAME:$API_KEY" "https://$CPANEL_DOMAIN:2083/json-api/cpanel?cpanel_jsonapi_apiversion=2&cpanel_jsonapi_module=ZoneEdit&cpanel_jsonapi_func=add_zone_record&domain=$DOMAIN&name=$CREATE_DOMAIN&type=TXT&txtdata=$CERTBOT_VALIDATION")
if [[ "$(echo $result | grep -o '"status":[01]' | cut -d':' -f2)" = '0' ]]; then
    echo 'Failed to create TXT record...'
    exit 1
fi

# Sleep to make sure the change has time to propagate over to DNS
sleep 25
