# Makefile for Docker Compose project

# Variables
DC= docker-compose -f srcs/docker-compose.yml

# Targets
build:
	$(DC) build
	mkdir -p ~/data/maria-volume
	mkdir -p ~/data/wordpress-volume

up:
	$(DC) up -d

down:
	$(DC) down

logs:
	$(DC) logs -f
clean:
	$(DC) down --rmi all

fclean: clean
	$(DC) down --volumes --remove-orphans
	sudo rm -rf ~/data

.PHONY: build up down logs