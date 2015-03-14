# fpmkin

This is image for php-fpm running.

Features:

php5.5 - out of box from Ubuntu tristy

local smtp if you have open relay for running container.

cron,sshd are included.

usage:

docker pull v7soft/fpmkin

docker run -it -v /data/sitedir/:/data/sitedir  --name sitedomain.ltd --hostname docker.sitedomain.ltd v7soft/fpmkin /sbin/my_init -- bash

or 

docker run -it -v /data/sitedir/:/data/sitedir  --name sitedomain.ltd --hostname docker.sitedomain.ltd v7soft/fpmkin

if you like ssh for access

WIP! 
