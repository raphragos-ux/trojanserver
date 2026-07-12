#!/bin/bash

# Gumawa ng Self-Signed SSL Certificate
openssl req -x509 -newkey rsa:4096 -keyout /app/key.key -out /app/cert.crt -days 3650 -nodes -subj "/C=PH/ST=Visayas/L=Iloilo/O=FreeData/CN=virgozki.com"

# Simulan ang Nginx
nginx

# Simulan ang Trojan
exec trojan -c /app/config.json
