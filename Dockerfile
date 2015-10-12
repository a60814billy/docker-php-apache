FROM debian:latest
MAINTAINER raccoon<a60814billy@gmail.com>

RUN apt-get update
RUN apt-get install vim apache2 php5 \
	php5-mcrypt php5-readline php5-memcache php5-curl php5-gd \
	php5-sqlite php5-mysql php5-pgsql \
	libapache2-mod-php5 mysql-client -y

RUN apt-get autoremove --purge -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

ADD start.sh /start.sh
ADD php.ini /etc/php5/apache2/
ADD envvars /etc/apache2/
RUN chmod +x start.sh
RUN useradd -u 1000 -M -s /bin/false -G www-data raccoon

EXPOSE 80
VOLUME ["/var/www/html", "/var/log/apache2"]
WORKDIR /
CMD ["/start.sh"]