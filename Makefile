all: mkdirs
	docker compose -f ./srcs/docker-compose.yml up -d

mkdirs:
	@if [ ! -d "/Users/phuwanate/data/" ]; then \
		mkdir /Users/phuwanate/data/; \
		mkdir -p /Users/phuwanate/data/wordpress; \
		mkdir -p /Users/phuwanate/data/database; \
	fi

down:
	docker compose -f ./srcs/docker-compose.yml down

re: clean all

clean: down
	docker rmi nginx:final mariadb:final wordpress:final

fclean: clean
	docker volume rm mariadb wordpress
	rm -rf /Users/phuwanate/data/

.PHONY: all down re clean fclean