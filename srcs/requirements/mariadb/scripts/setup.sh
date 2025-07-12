#!/bin/bash

# Check if MariaDB is already initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
# else
#     echo "MariaDB already initialized"
fi

# Ensure proper permissions
chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /run/mysqld

mysqld_safe --user=mysql --skip-grant-tables &
sleep 15

# Setup database and users
mysql -u root << EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF
# Shutdown the MariaDB server
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

exec mysqld_safe --user=mysql