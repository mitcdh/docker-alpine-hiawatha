# Dockerised Alpine, PHP-FPM, and Composer

Docker base image for PHP-FPM (with composer preinstalled) based on [AlpineLinux](http://alpinelinux.org).

Intended for use behind a [reverse proxy](https://github.com/jwilder/nginx-proxy) of some sort.

### Usage
````bash
docker pull mitcdh/fpm-composer
````

### Structure
* `/www`: Web root

### Exposed Ports
* `80`: http web server