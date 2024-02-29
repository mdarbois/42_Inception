FROM debian:bullseye

EXPOSE 3306

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/maria_script.sh /usr/local/bin

RUN chmod +x /usr/local/bin/maria_script.sh

ENTRYPOINT [ "bash", "/usr/local/bin/maria_script.sh" ]
# "tail -f /dev/null"