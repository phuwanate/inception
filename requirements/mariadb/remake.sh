sudo docker rm test && sudo docker rmi mariadb

sudo docker build -t mariadb .

sudo docker run --env-file ~/Desktop/inception/.env --name test mariadb

sudo docker exec -it test bash
