# Check Database Connection

- To access mysql in wordpress container
```
mysql -u plertsir -p -h mariadb -P 3306
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

# Database configuration command
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

# Service checking command
- To check php-fpm status
```
service php8.2-fpm status
```
- To check nginx status
```
service nginx status
```

- TO list all service
```
service --status-all
```


