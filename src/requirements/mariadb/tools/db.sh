#!/bin/bash

service mariadb start

sleep 3

# Set the root password
mysqladmin -u root --password="${MYSQL_ROOT_PASSWORD}" password "${MYSQL_ROOT_PASSWORD}"

# Delete anonymous users
mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "DELETE FROM mysql.user WHERE User='';"

# Flush privileges
mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

mysql -e "FLUSH PRIVILEGES;" --password="${MYSQL_ROOT_PASSWORD}"

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

mysqld