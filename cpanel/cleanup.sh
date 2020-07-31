#!/bin/bash

source ./config.sh
echo "Removing certbot validation records for $CERTBOT_DOMAIN"

# Find records for cleanup
records="$(curl -s -H"Authorization: cpanel ${USERNAME}:${API_KEY}" "https://${CPANEL_DOMAIN}:2083/json-api/cpanel?cpanel_jsonapi_apiversion=2&cpanel_jsonapi_module=ZoneEdit&cpanel_jsonapi_func=fetchzone_records&domain=${DOMAIN}&customonly=1&name=${CREATE_DOMAIN}&type=TXT")"

# Remove records recursively if exists
for line in $(echo $records | grep -o '"line":[0-9]\{1,2\}' | cut -d':' -f2); do
    echo "Removing TXT record for $CERTBOT_DOMAIN on line $line"
    result=$(curl -s -H"Authorization: cpanel ${USERNAME}:${API_KEY}" "https://${DOMAIN}:2083/json-api/cpanel?cpanel_jsonapi_apiversion=2&cpanel_jsonapi_module=ZoneEdit&cpanel_jsonapi_func=remove_zone_record&domain=${DOMAIN}&line=${line}" | grep -o '"status":[01]' | cut -d':' -f2)
    if [[ "$result" = '0' ]]; then
        echo 'Failed to remove records, please remove it manually before continue'
        exit 1
    fi
done
