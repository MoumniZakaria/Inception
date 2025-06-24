#!/bin/bash

sleep 10

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/wp

# cp wp-config-sample.php wp-config.php

/usr/wp core download --allow-root
/usr/wp config create --dbname=wordpress --dbuser=zmoumni --dbpass=password --dbhost=mariadb --allow-root
/usr/wp core install --url=localhost --title=inception --admin_user=zmoumni --admin_password=password --admin_email=zmoumni@admin.com --allow-root
 


php-fpm7.4 -F