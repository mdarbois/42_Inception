FROM debian:buster

RUN apt update -y

COPY ./tools/script.sh /

RUN apt install vsftpd -y

CMD ["/script.sh"]