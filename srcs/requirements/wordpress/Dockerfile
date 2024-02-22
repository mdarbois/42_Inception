FROM debian:bullseye

EXPOSE 9000

RUN apt-get -y update
RUN apt-get -y upgrade -y
RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget

RUN apt-get install -y php php7.3 php-fpm php-mysql mariadb-client
RUN apt install curl -y

COPY conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/script.sh /usr/local/bin

RUN  chmod +x /usr/local/bin/script.sh

ENTRYPOINT ["/usr/local/bin/script.sh"]
