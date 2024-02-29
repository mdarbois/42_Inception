FROM debian:bullseye

EXPOSE 9000

RUN apt-get -y update -y
RUN apt-get -y upgrade -y
RUN apt-get -y install wget

RUN apt-get install -y php7.4 php7.4-fpm php-mysql mariadb-client
RUN apt-get install curl -y
RUN apt-get install redis-server php-redis -y

COPY ./conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www
RUN wget https://wordpress.org/wordpress-6.3.tar.gz -P .
RUN tar -xzf wordpress-6.3.tar.gz -C /var/www && rm -rf wordpress-6.3.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/wp_script.sh /usr/local/bin

RUN  chmod +x /usr/local/bin/wp_script.sh

WORKDIR /

ENTRYPOINT [ "bash", "/usr/local/bin/wp_script.sh" ]

# ENTRYPOINT cat /var/www/wordpress/wp-config.php
