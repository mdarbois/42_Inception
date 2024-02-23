FROM debian:buster

RUN apt update -y

COPY ./tools/adminer_script.sh /

RUN  chmod +x /adminer_script.sh

RUN apt install wget -y
RUN apt-get install php php-mysql -y

EXPOSE 8080

CMD ["/adminer_script.sh"]