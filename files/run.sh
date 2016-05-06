#!/bin/sh

chmod -R +x /scripts/pre-run/ 
run-parts --verbose --exit-on-error /scripts/pre-run/ || exit $?

chown -R web-srv:www-data /www
hiawatha -d
