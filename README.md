# Certbot Manual Hook Scripts
This repository contain the scripts for certbot hooks that is not available in the official certbot plugins.

## Usage
Configure certbot and clone this repo to `/etc/letsencrypt/custom-auth-hooks/`. Configure the hooks in `config.sh`
in each respective folder, e.g. if you used CPanel, configure `cpanel/config.sh`. To use the scripts with certbot, simply
add the options `--manual-auth-hook /etc/letsencrypt/custom-auth-hooks/authenticator.sh` and
`--manual-cleanup-hook /etc/letsencrypt/custom-auth-hooks/cleanup.sh`, example below:

`certbot renew --manual --preferred-challenges=dns --manual-auth-hook /etc/letsencrypt/custom-auth-hooks/authenticator.sh --manual-cleanup-hook /etc/letsencrypt/custom-auth-hooks/cleanup.sh -d secure.example.com`

## References
- [Certbot Manual Hook Documentation](https://certbot.eff.org/docs/using.html)
