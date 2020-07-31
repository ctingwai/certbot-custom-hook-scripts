# Certbot Manual Hook Scripts
This repository contain the scripts for certbot hooks that is not available in the official certbot plugins.

## Usage
Configure certbot and clone this repo to `/etc/letsencrypt/custom-auth-hooks/`. Configure the hooks in `config.sh`
in each respective folder, e.g. if you used CPanel, configure `cpanel/config.sh`. To use the scripts with certbot, simply
add the options `--manual-auth-hook /etc/letsencrypt/certbot-custom-hook-scripts/cpanel/authenticator.sh` and
`--manual-cleanup-hook /etc/letsencrypt/certbot-custom-hook-scripts/cpanel/cleanup.sh`, example below:

Sample non-interactive certificate renewal for the domain `example.com`:
```
certbot certonly -n --manual --manual-public-ip-logging-ok --preferred-challenges=dns --manual-auth-hook /etc/letsencrypt/certbot-custom-hook-scripts/cpanel/authenticator.sh --manual-cleanup-hook /etc/letsencrypt/certbot-custom-hook-scripts/cpanel/cleanup.sh -d example.com -d *.example.com
```

With this command, it's possible to schedule certbot renewal using `cron` with the combination such as:
```
certbot certonly -n --manual --manual-public-ip-logging-ok --preferred-challenges=dns --manual-auth-hook /etc/letsencrypt/certbot-custom-hook-scripts/cpanel/authenticator.sh --manual-cleanup-hook /etc/letsencrypt/certbot-custom-hook-scripts/cpanel/cleanup.sh --post-hook "systemctl restart httpd" -d example.com -d *.example.com
```

## References
- [Certbot Manual Hook Documentation](https://certbot.eff.org/docs/using.html)
