FROM debian:bullseye

EXPOSE 9000

RUN apt-get -y update
RUN apt-get -y upgrade -y
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install wget

RUN apt-get install -y php php7.4 php7.4-fpm php-mysql mariadb-client
RUN apt-get install curl -y

COPY conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/wp_script.sh /usr/local/bin

RUN  chmod +x /usr/local/bin/wp_script.sh

ENTRYPOINT ["/usr/local/bin/wp_script.sh"]
#WORKDIR /var/www/wordpress

# ENTRYPOINT cat /var/www/wordpress/wp-config.php
