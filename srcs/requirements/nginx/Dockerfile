FROM debian:bullseye

EXPOSE 443

RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install vim -y 
RUN apt install curl -y 

RUN apt install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -newkey rsa:4096 -days 365 \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=DE/ST=Berlin/L=Berlin/O=42 School/OU=mdarbois/CN=mdarbois.42.fr/UID=mdarbois"

#store nginx logs
RUN mkdir -p /run/nginx
COPY conf/nginx.conf  /etc/nginx/conf.d/server.conf

CMD [ "nginx", "-g", "daemon off;" ]