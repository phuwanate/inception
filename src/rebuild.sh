sudo docker compose down

sudo docker rmi nginx:final wordpress:final mariadb:final

sudo docker compose -f docker-compose.yml up