#!/bin/bash

if [ ! -d /var/lib/mysql/$SQL_DATABASE ]; then
  #mysql_install_db
  #/usr/share/mariadb/mysql.server start

#chmod -R 770 /var/lib/mysql
#chgrp -R mysql /var/lib/mysql
#chmod 755 /etc/init.d/mysql

service mariadb start

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

mariadb -u root -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

mariadb -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mariadb -u root -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
fi
exec mysqld_safe
