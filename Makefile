all: mkdirs
	@docker compose -f ./srcs/docker-compose.yml up -d

mkdirs:
	@if [ ! -d "/Users/phuwanate/Desktop/data/" ]; then \
        sudo mkdir -p /Users/phuwanate/Desktop/data/; \
        sudo mkdir -p /Users/phuwanate/Desktop/data/wordpress; \
        sudo mkdir -p /Users/phuwanate/Desktop/data/database; \
        sudo chown -R phuwanate:staff /Users/phuwanate/Desktop/data; \
    fi

down:
	@docker compose -f ./srcs/docker-compose.yml down

re: clean all

clean: down
	@docker rmi -f $$(docker images -qa)

fclean: clean
	@docker volume rm $$(docker volume ls -q); \
	sudo rm -rf /Users/phuwanate/Desktop/data/

.PHONY: all down re clean fclean