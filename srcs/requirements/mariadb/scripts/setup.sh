#!/bin/bash



# Start MariaDB service
service mariadb start

while ! mysqladmin ping --silent; do
    sleep 1
    echo "waiting for mariadb"
done


# Create database if not exists
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

# Create user if not exists  
mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# mysql -u root -e "CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'root1234';"

# Grant privileges
mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"

mysql -u root -e "FLUSH PRIVILEGES;"


# mysqladmin -u root -p"root1234" shutdown

# Stop service and start in foreground
# service mariadb stop

exec mysqld_safe