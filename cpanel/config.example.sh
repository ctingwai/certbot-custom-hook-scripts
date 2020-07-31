#!/bin/bash

# Get your API key from CPanel
USERNAME=""
API_KEY=""
CPANEL_DOMAIN=""

# Strip only the top domain to get the zone domain
DOMAIN=$(expr match "$CERTBOT_DOMAIN" '.*\.\(.*\..*\)')

# Get the txt record name that will be created
CREATE_DOMAIN="_acme-challenge.$CERTBOT_DOMAIN."
