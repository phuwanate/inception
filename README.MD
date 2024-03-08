# Check Database Connection

mysql -u plertsir -p -h mariadb -P 3306

SHOW DATABASES;

USE wordpress_db;

SHOW TABLES;

SELECT * FROM wp_options WHERE option_name IN ('siteurl', 'home');
