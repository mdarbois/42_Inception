#!bin/bash


wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php 
chown -R root:root /var/www/html/adminer.php 
chmod 755 /var/www/html/adminer.php


cd /var/www/html

php -S 0.0.0.0:8080