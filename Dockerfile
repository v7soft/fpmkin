FROM phusion/baseimage:latest

RUN apt-get update && DEBIAN_FRONTEND='noninteractive' apt-get -y dist-upgrade && \
DEBIAN_FRONTEND='noninteractive' apt-get -y install php-db php-pear php5-curl php5-fpm php5-gd php5-interbase \
php5-mcrypt php5-memcache php5-mysql php5-odbc php5-sybase php5-apcu debconf-utils && \
sed -i "s/;date.timezone =.*/date.timezone = Asia\/Novosibirsk/; s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/; s/short_open_tag/;short_open_tag/" /etc/php5/fpm/php.ini && \
sed -i "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf && \
mkdir /etc/service/phpfpm && \
echo "#!/usr/bin/env bash" > /etc/service/phpfpm/run && \
echo "php5-fpm -c /etc/php5/fpm" >> /etc/service/phpfpm/run && \
echo extension=interbase.so > /etc/php5/fpm/conf.d/30-interbase.ini && \
chmod +x /etc/service/phpfpm/run && \
echo "#!/usr/bin/env bash" > /etc/my_init.d/init.sh && \
echo "/data/*/conf/init.sh" >> /etc/my_init.d/init.sh && \  
chmod +x /etc/my_init.d/init.sh && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
