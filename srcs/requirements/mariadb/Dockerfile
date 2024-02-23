FROM debian:bullseye

EXPOSE 3306

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/mariadb.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/maria_script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/maria_script.sh

ENTRYPOINT [ "/usr/local/bin/maria_script.sh"]
