sudo docker rm test && sudo docker rmi wordpress

sudo docker build -t wordpress .

sudo docker run --env-file ~/Desktop/inception/src/.env -it --name test wordpress bash

#sudo docker exec -it test bash

#Check Database linking
#USE wordpress_db;
#SELECT * FROM wp_options WHERE option_name IN ('siteurl', 'home');
