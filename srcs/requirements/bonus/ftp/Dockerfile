FROM debian:buster

RUN apt update -y

COPY ./tools/ftp_script.sh /

RUN chmod +x /ftp_script.sh

RUN apt install vsftpd -y

EXPOSE 21

CMD ["/ftp_script.sh"]