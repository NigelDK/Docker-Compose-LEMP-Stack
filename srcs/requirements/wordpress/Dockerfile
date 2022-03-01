FROM	debian:buster-20220125

RUN		apt-get update -y && \
		apt-get install -y wget && \
		apt-get install -y mariadb-client && \
		apt-get install -y php7.3 php-fpm php-mysqli \
							php-curl php-dom php-cgi php-gd \
							php-zip php-imagick php-mbstring \
							php-mysql && \
		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp && \
		mkdir -p /var/www/html /run/php

COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html

EXPOSE	9000

COPY		./tools/configure.sh /
ENTRYPOINT	["sh", "/configure.sh"]