#!/bin/bash

# Initialize MariaDB
echo "Initializing MariaDB..."
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Start MariaDB temporarily for setup
echo "Starting MariaDB temporarily..."
mysqld_safe --user=mysql --skip-networking &
MYSQL_PID=$!

# Wait for MariaDB to be ready
echo "Waiting for MariaDB to be ready..."
while ! mysqladmin ping --silent; do
    sleep 1
done

# Setup database
echo "Setting up database..."
mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

# Stop temporary instance
echo "Stopping temporary instance..."
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
wait $MYSQL_PID

# Start MariaDB in foreground
echo "Starting MariaDB..."
exec mysqld_safe --user=mysql