DIR="./srcs/docker-compose.yml"

all: up

up:
	@mkdir -p /home/${USER}/data/mariadb
	@mkdir -p /home/${USER}/data/wordpress

	@sudo chown -R 101:101 /home/mel-atti/data/mariadb
	@sudo chown -R 33:33 /home/mel-atti/data/wordpress

	@docker compose -f $(DIR) up --build -d

clean: down

down:
	@docker compose -f $(DIR) down

fclean: clean
	@docker system prune -af
	@sudo rm -rf /home/${USER}/data/mariadb
	@sudo rm -rf /home/${USER}/data/wordpress

re: fclean all

.PHONY: all up down clean fclean re
