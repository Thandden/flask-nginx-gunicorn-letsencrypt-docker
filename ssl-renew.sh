#!/bin/bash

# Run the certbot renew command
docker run --rm -p 8080:8080 --name certbot -v "/root/application/certbot-data:/etc/letsencrypt" -v "/root/application/certbot-var:/var/lib/letsencrypt" certbot/certbot certonly --standalone --agree-tos --email example@example.com  -d example.com --renew-by-default

# Restart NGINX container so the new cert applies
docker restart application_nginx_1
