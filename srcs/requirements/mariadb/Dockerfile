FROM debian:buster

EXPOSE 3306

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/mariadb.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/script.sh /usr/local/bin/

RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh"]

EXPOSE 3306
