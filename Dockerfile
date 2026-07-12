FROM alpine:3.19

RUN apk update && apk add --no-cache \
    nginx \
    openssl \
    wget \
    tar \
    bash

WORKDIR /app

# I-download ang tamang Trojan Release
RUN wget -O trojan.tar.xz https://github.com/trojan-gfw/trojan/releases/download/v1.16.0/trojan-1.16.0-linux-amd64.tar.xz && \
    tar -xf trojan.tar.xz && \
    mv trojan-1.16.0-linux-amd64/trojan /usr/local/bin/ && \
    chmod +x /usr/local/bin/trojan && \
    rm -rf trojan.tar.xz trojan-1.16.0-linux-amd64

COPY config.json /app/config.json
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

EXPOSE 80 443

CMD ["/app/entrypoint.sh"]
