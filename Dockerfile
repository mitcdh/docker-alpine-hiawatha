FROM alpine:edge
MAINTAINER Mitchell Hewes <me@mitcdh.com>

RUN apk add --update \
    musl \
    libxslt \
    zlib \
    libxml2 \
    mbedtls  && \
    apk add hiawatha --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    rm -rf /var/cache/apk/*

# Add user and group
RUN addgroup -S www-data && \
    adduser -S -G www-data -g "Web Server" -h "/www" web-srv && \
    mkdir -p /scripts/pre-run/ && \
    chmod -R 700 /scripts/ && \
    mkdir -p /etc/hiawatha/conf.d && \
    chown web-srv:www-data /etc/hiawatha/conf.d && \
    ln -sf /dev/stdout /var/log/hiawatha/access.log && \
    ln -sf /dev/stdout /var/log/hiawatha/system.log && \
    ln -sf /dev/stdout /var/log/hiawatha/exploit.log && \
    ln -sf /dev/stdout /var/log/hiawatha/error.log

# Add configuration
ADD files/hiawatha.conf /etc/hiawatha/hiawatha.conf
ADD files/run.sh /scripts/run.sh

EXPOSE 80

CMD ["/scripts/run.sh"]
