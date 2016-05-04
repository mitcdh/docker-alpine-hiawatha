#!/bin/sh

if [ -f /scripts/pre-run.sh ]; then
	chmod 700 /scripts/pre-run.sh
	/scripts/pre-run.sh || exit $?
fi

if [ ! -d /www ] ; then
	mkdir -p /www
fi
chown -R nginx:www-data /www

# start php-fpm
php-fpm

# start nginx
if [ ! -d /tmp/nginx ] ; then
	mkdir -p /tmp/nginx
fi
chown -R nginx /tmp/nginx
nginx
