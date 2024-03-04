sudo docker rm test && sudo docker rmi wordpress

sudo docker build -t wordpress .

sudo docker run --env-file ~/Desktop/inception/src/.env -it --name test wordpress bash

#sudo docker exec -it test bash



#Check Database linking
#mysql -u plertsir -p -h mariadb -P 3306
#SHOW DATABASES;
#USE wordpress_db;
#SHOW TABLES;
#SELECT * FROM wp_options WHERE option_name IN ('siteurl', 'home');
