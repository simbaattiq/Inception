all: up
    
up:
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	docker-compose -f srcs/docker-compose.yml up -d --build

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -af

fclean: clean
	sudo rm -rf /home/${USER}/data

re: fclean all

.PHONY: all up down clean fclean re