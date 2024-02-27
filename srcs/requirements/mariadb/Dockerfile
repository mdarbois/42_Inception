FROM alpine:3.19

EXPOSE 3306

RUN apk update
RUN apk add --no-cache mariadb mariadb-client

COPY conf/mariadb.conf	/etc/my.cnf.d/mariadb-server.cnf

COPY ./conf/maria_script.sh /

RUN chmod +x /maria_script.sh

ENTRYPOINT [ "sh", "/maria_script.sh" ]

STOPSIGNAL SIGQUIT

CMD [ "mysql_safe" ]