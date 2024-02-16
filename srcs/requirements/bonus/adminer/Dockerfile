FROM debian:buster

RUN apt update -y

COPY ./tools/script.sh /

RUN apt install wget -y
RUN apt-get install php php-mysql -y

CMD ["/script.sh"]