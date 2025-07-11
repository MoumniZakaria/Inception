#!/bin/bash

sleep 10


rm -rf /usr/wp

# Download WP-CLI if not present

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Download WordPress core
wp core download --allow-root

# Create wp-config.php
wp config create \
    --dbname="${MYSQL_DATABASE}" \
    --dbuser="${MYSQL_USER}" \
    --dbpass="${MYSQL_PASSWORD}" \
    --dbhost="${WORDPRESS_DB_HOST}" \
    --allow-root

# Install WordPress
wp core install \
    --url="${WORDPRESS_URL}" \
    --title="${WORDPRESS_TITLE}" \
    --admin_user="${WORDPRESS_ADMIN_USER}" \
    --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
    --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
    --allow-root

# Create additional user
wp user create "${WORDPRESS_AUTHOR_USER}" "${WORDPRESS_AUTHOR_EMAIL}" \
    --role=author \
    --user_pass="${WORDPRESS_AUTHOR_PASSWORD}" \
    --allow-root



exec php-fpm7.4 -F