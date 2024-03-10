#!/bin/bash

service mariadb start

sleep 3

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "Database already exists"
else
    # Set the root password
    mysqladmin -u root password "${MYSQL_ROOT_PASSWORD}"

    # Delete anonymous users
    mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "DELETE FROM mysql.user WHERE User='';"
    mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
    mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
    mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
    mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
fi
#Shut down background process
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
#restart in foreground
mysqld