FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade -y
RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget

RUN apt install -y php-fpm\
	php-mysql -y
RUN apt install curl -y

COPY conf/script.sh /script.sh

RUN  chmod +x script.sh

ENTRYPOINT ["script.sh"]