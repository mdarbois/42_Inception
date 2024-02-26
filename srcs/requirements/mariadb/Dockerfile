FROM debian:bullseye

EXPOSE 3306

RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y

# COPY conf/mariadb.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/maria_script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/maria_script.sh

ENTRYPOINT [ "/usr/local/bin/maria_script.sh"]
