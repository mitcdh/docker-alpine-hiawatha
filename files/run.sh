#!/bin/sh

if [ -f /scripts/pre-run.sh ]; then
	chmod 700 /scripts/pre-run.sh
	/scripts/pre-run.sh || exit $?
fi

if [ ! -d /www ] ; then
	mkdir -p /www
fi
chown -R php-srv:www-data /www

php-fpm
