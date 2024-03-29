# Database Connection

- To access mysql in wordpress container
```
mysql -u [MYSQL_USER, root] -p -h mariadb -P 3306
```

- To list all databases
```
SHOW DATABASES;
```

- To use database
```
USE [database_name];
```

- To list all tables
```
SHOW TABLES;
```

# Database Configuration Command
- To access mysql with specific user
```
mysql -u [...] -p
```

- To execute SQL with commandline
```
-e [SQL Query command]
```

- Start mysql on foreground process
```
mysqld
```

# Service Checking Command
- To check php-fpm status
```
service php8.2-fpm status
```
- To check nginx status
```
service nginx status
```

- To list all service
```
service --status-all
```


