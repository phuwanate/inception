# Check Database Connection

- To access mysql in wordpress container
mysql -u plertsir -p -h mariadb -P 3306

- To list all databases
SHOW DATABASES;

- To use database
USE [database_name];

- To list all tables
SHOW TABLES;

# Database configuration command
- To access mysql with specific user
mysql -u [...]

- To execute SQL with commandline
-e -> to execute SQL with commandline



- Start mysql on foreground process
mysqld
