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
    rm -rf /var/cache/apk/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user and group
RUN addgroup -S www-data && \
    adduser -S -G www-data -g "PHP-FPM Server" -h "/www" php-srv

# Add configuration
ADD files/php-fpm.conf /etc/php/
ADD files/run.sh /scripts/run.sh
RUN chmod -R 700 /scripts/

EXPOSE 9000

CMD ["/scripts/run.sh"]
