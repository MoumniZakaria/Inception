#!/bin/bash

sleep 10

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/wp

/usr/wp core download --allow-root

/usr/wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --allow-root

/usr/wp core install --url=$DOMAINE_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root

/usr/wp user create $WP_AUTHOR_USER $WP_AUTHOR_EMAIL --role=author --user_pass=$WP_AUTHOR_PASSWORD --allow-root

php-fpm7.4 -F