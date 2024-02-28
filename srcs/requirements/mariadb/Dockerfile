FROM debian:bullseye

EXPOSE 3306

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY conf/mariadb.conf	/etc/my.cnf.d/mariadb-server.cnf

COPY ./conf/maria_script.sh /usr/local/bin

RUN chmod +x /usr/local/bin/maria_script.sh

ENTRYPOINT [ "/usr/local/bin/maria_script.sh" ]
# "tail -f /dev/null"