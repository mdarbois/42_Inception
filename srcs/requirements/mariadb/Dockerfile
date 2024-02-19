FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/mariadb.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/script.sh /script.sh

RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh"]

EXPOSE 3306
