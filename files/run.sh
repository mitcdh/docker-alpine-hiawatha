#!/bin/sh

chmod -R +x /scripts/pre-run/ 
run-parts --exit-on-error /scripts/pre-run/ || exit $?

chown -RL web-srv:www-data /www
chown -R web-srv:www-data /etc/hiawatha/conf.d

exec hiawatha -d
