FROM phusion/baseimage:latest

RUN apt-get update && DEBIAN_FRONTEND='noninteractive' apt-get -y install php-db php-pear php5-curl php5-fpm php5-gd php5-interbase php5-mcrypt php5-memcache php5-mysql php5-odbc php5-sybase php5-xcache && \
sed -i "s/;date.timezone =.*/date.timezone = NOVT/; s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini && \
mkdir /etc/service/phpfpm && \
echo "#!/usr/bin/env bash" > /etc/service/phpfpm/run && \
echo "php5-fpm -F -c /etc/php5/fpm" >> /etc/service/phpfpm/run && \
chmod +x /etc/service/phpfpm/run && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
