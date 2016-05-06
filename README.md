# Docker Hiawatha Web Server

Docker base image for a Hiawatha web server running on [AlpineLinux](http://alpinelinux.org).

Originally intended for use behind a [reverse proxy](https://github.com/jwilder/nginx-proxy) of some sort.

### Usage
````bash
docker pull mitcdh/alpine-hiawatha
````

### Structure
* `/www`: Web root

### Exposed Ports
* `80`: http web server