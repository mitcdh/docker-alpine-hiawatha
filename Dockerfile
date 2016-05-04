FROM alpine:edge
MAINTAINER Mitchell Hewes <me@mitcdh.com>

RUN apk --update add \
    nginx \
    ca-certificates \
    curl \
    git \
    php-fpm \
    php-curl \
    php-json \
    php-xml \
    php-phar \
    php-intl \
    php-openssl && \
    rm -rf /var/cache/apk/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add configuration
ADD files/nginx.conf /etc/nginx/
ADD files/php-fpm.conf /etc/php/
ADD files/run.sh /scripts/run.sh
RUN chmod -R 700 /scripts/

# Setup Directories
RUN mkdir /www
RUN chown nginx:www-data /www

EXPOSE 80

CMD ["/scripts/run.sh"]
