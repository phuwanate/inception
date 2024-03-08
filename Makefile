all:
	mkdir /Users/phuwanate/data/; \
	mkdir /Users/phuwanate/data/wordpress; \
	mkdir /Users/phuwanate/data/database; \
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

re: clean all

clean: down
	docker rmi nginx:final mariadb:final wordpress:final

fclean: clean
	docker volume rm mariadb wordpress
	rm -rf /Users/phuwanate/data/

.PHONY: all down re clean fclean