#!/bin/bash


#if [ ! -d /var/www/wordpress ]; then 
#    mkdir /var/www/
#    mkdir /var/www/wordpress
#    cd /var/www
#    wget https://wordpress.org/wordpress-6.3.tar.gz
#    tar -xzf wordpress-6.3.tar.gz && rm -rf wordpress-6.3.tar.gz
#    chown -R root:root /var/www/wordpress
#    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#    chmod +x wp-cli.phar
#    mv wp-cli.phar /usr/local/bin/wp
#fi

until mariadb --host=mariadb --user=$SQL_USER --password=$SQL_PASSWORD -e '\c'; do
    echo >&2 "`date`: maria is sleeping"
    sleep 2
done

cd /var/www/wordpress

# downloads the WP-CLI PHAR (PHP Archive) file from the GitHub repository. 
#curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# makes the WP-CLI PHAR file executable.
#chmod +x wp-cli.phar 

# moves the WP-CLI PHAR file to the /usr/local/bin directory, which is in the system's PATH, and renames it to wp. This allows you to run the wp command from any directory
#mv wp-cli.phar /usr/local/bin/wp

#chown -R root:root /var/www/wordpress
#chmod -R 755 /var/www/wordpress

#cd /var/www/wordpress

#wp core download --allow-root

if [ ! -f /var/www/wordpress/wp-config.php ]; then
# change the those lines in wp-config.php file to connect with database
    wp config create  --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306

fi
# installs WordPress and sets up the basic configuration for the site. The --url option specifies the URL of the site, --title sets the site's title, --admin_user and --admin_password set the username and password for the site's administrator account, and --admin_email sets the email address for the administrator. The --skip-email flag prevents WP-CLI from sending an email to the administrator with the login details.
wp core install --url=$DOMAIN_NAME/ --title=$WEBSITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email --allow-root

# creates a new user account with the specified username, email address, and password. The --role option sets the user's role to author, which gives the user the ability to publish and manage their own posts.
wp user create $USER1_LOGIN $USER1_MAIL --role=editor --user_pass=$USER1_PASSWORD --allow-root

# installs the Astra theme and activates it for the site. The --activate flag tells WP-CLI to make the theme the active theme for the site.
wp theme install astra --activate --allow-root

#bonus
wp config set WP_REDIS_HOST redis --add --allow-root
wp config set WP_REDIS_PORT 6379 --add --allow-root  
wp config set WP_CACHE true --add --allow-root  
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root


# uses the sed command to modify the www.conf file in the /etc/php/7.3/fpm/pool.d directory. The s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g command substitutes the value 9000 for /run/php/php7.3-fpm.sock throughout the file. This changes the socket that PHP-FPM listens on from a Unix domain socket to a TCP port.
#sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# creates the /run/php directory, which is used by PHP-FPM to store Unix domain sockets.
if [ ! -d /run/php ] ; then 
    mkdir /run/php
fi

#bonus
wp redis enable --allow-root

# starts the PHP-FPM service in the foreground. The -F flag tells PHP-FPM to run in the foreground, rather than as a daemon in the background.
/usr/sbin/php-fpm7.4 -F
