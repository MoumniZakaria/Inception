#!/bin/bash

# Start MariaDB service
service mariadb start

# Create database if not exists
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

# Create user if not exists  
mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Grant privileges
mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

# Stop service and start in foreground
service mariadb stop

exec mysqld_safe --user=mysql