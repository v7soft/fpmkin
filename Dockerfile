FROM phusion/baseimage:latest

RUN apt-get update && apt-get -y install php-db php-pear php5-curl php5-fpm php5-gd php5-interbase php5-mcrypt php5-memcache php5-mysql php5-odbc php5-sybase php5-xcache && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
