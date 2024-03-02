sudo docker rm test && sudo docker rmi nginx

sudo docker build -t nginx .

sudo docker run -p 443:443 --name test nginx

sudo docker exec -it test bash
