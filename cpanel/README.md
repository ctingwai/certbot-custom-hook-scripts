# CPanel Webhook Scripts for Certbot

## Configuration
1. Copy `config.example.sh` to `config.sh`: `cp config.example.sh config.sh`
2. Generate an API Token in CPanel - refer to references below for more details.
3. Replace `API_KEY` value with the token you generated from the previous step.
4. Replace `USERNAME` value with your cpanel username
5. Repalce `CPANEL_DOMAIN` value with your cpanel domain without protocols and trailing slash, e.g. `example.com`

## References
- [Generate an API Token](https://documentation.cpanel.net/display/80Docs/Manage+API+Tokens+in+WHM)
