#!/bin/bash

# Gumawa ng pansamantalang SSL certificate (para sa testing)
openssl req -x509 -newkey rsa:4096 -keyout /etc/trojan/key.key -out /etc/trojan/cert.crt -days 365 -nodes -subj "/C=PH/ST=Iloilo/L=IloiloCity/O=FreeData/OU=Tech/CN=example.com"

# I-download at i-install ang Trojan binary
wget -O /usr/bin/trojan https://github.com/trojan-gfw/trojan/releases/download/v1.16.0/trojan-1.16.0-linux-amd64.tar.xz
tar -xf /usr/bin/trojan -C /usr/bin/
chmod +x /usr/bin/trojan

# Simulan ang Nginx sa background
nginx -g 'daemon off;' &

# Simulan ang Trojan Server
/usr/bin/trojan -c /etc/trojan/config.json
