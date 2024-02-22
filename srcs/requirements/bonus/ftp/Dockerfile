FROM debian:buster

RUN apt update -y

COPY ./tools/script.sh /

RUN apt install vsftpd -y

EXPOSE 21

CMD ["/script.sh"]