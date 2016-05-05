FROM alpine:edge
MAINTAINER Mitchell Hewes <me@mitcdh.com>

RUN apk --update add \
    php-fpm \
    php-curl \
    php-json \
    php-xml \
    php-phar \
    php-intl \
    php-openssl \
    ca-certificates \
    curl \
    git && \
    apk add hiawatha  --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    rm -rf /var/cache/apk/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user and group
RUN addgroup -S www-data && \
    adduser -S -G www-data -g "PHP-FPM Server" -h "/www" php-srv && \
    adduser -S -G www-data -g "Web Server" -h "/var/lib/www" web-srv

# Add configuration
ADD files/hiawatha.conf /etc/php/hiawatha.conf
ADD files/php-fpm.conf /etc/php/
ADD files/run.sh /scripts/run.sh
RUN chmod -R 700 /scripts/

EXPOSE 80

CMD ["/scripts/run.sh"]
