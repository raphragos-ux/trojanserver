# Base image: Alpine Linux (maliit at mabilis)
FROM alpine:latest

# Mag-install ng mga kailangang package
RUN apk update && apk add --no-cache \
    nginx \
    wget \
    curl \
    bash

# Gumawa ng folder para sa app
WORKDIR /etc/trojan

# Kopyahin ang mga file papuntang container
COPY config.json /etc/trojan/config.json
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh

# Bigyan ng pahintulot ang entrypoint
RUN chmod +x /entrypoint.sh

# Buksan ang port
EXPOSE 80 443

# Simulan ang serbisyo
CMD ["/entrypoint.sh"]
