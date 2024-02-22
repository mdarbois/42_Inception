FROM debian:buster

RUN apt update -y

COPY ./tools/script.sh /

RUN apt install wget -y
RUN apt-get install php php-mysql -y

EXPOSE 8080

CMD ["/script.sh"]