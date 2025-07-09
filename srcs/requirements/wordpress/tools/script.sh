#!/bin/bash
sleep 10

cd /var/www/html


# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/wp

if ! /usr/wp core is-installed --allow-root --path="/var/www/html"; then
    /usr/wp core download --allow-root --path="/var/www/html"
    /usr/wp config create --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --allow-root --path="/var/www/html"
    /usr/wp core install --url="$DOMAINE_NAME" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL" --allow-root --path="/var/www/html"
fi

if ! /usr/wp user get "$WORDPRESS_AUTHOR_USER" --allow-root --path="/var/www/html" > /dev/null 2>&1; then
    /usr/wp user create "$WORDPRESS_AUTHOR_USER" "$WORDPRESS_AUTHOR_EMAIL" --role=author --user_pass="$WORDPRESS_AUTHOR_PASSWORD" --allow-root --path="/var/www/html"
fi

php-fpm7.4 -F
