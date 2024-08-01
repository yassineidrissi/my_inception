# Makefile for Docker Compose project

# Variables
DC= docker-compose -f srcs/docker-compose.yml

# Targets
build:
	@echo "\033[92m░░███╗░░██████╗░██████╗░███████╗\033[0m███╗░░░███╗███████╗██████╗░"
	@echo "\033[92m░████║░░╚════██╗╚════██╗╚════██║\033[0m████╗░████║██╔════╝██╔══██╗"
	@echo "\033[92m██╔██║░░░█████╔╝░█████╔╝░░░░██╔╝\033[0m██╔████╔██║█████╗░░██║░░██║"
	@echo "\033[92m╚═╝██║░░░╚═══██╗░╚═══██╗░░░██╔╝░\033[0m██║╚██╔╝██║██╔══╝░░██║░░██║"
	@echo "\033[92m███████╗██████╔╝██████╔╝░░██╔╝░░\033[0m██║░╚═╝░██║███████╗██████╔╝"
	@echo "\033[92m╚══════╝╚═════╝░╚═════╝░░░╚═╝░░░\033[0m╚═╝░░░░░╚═╝╚══════╝╚═════╝░"
	@echo "\033[92m building...⌛\033[0m"
	$(DC) build
	mkdir -p ~/data/maria-volume
	mkdir -p ~/data/wordpress-volume
	@echo "\033[93m Image built successfully!🎉\033[0m"

#starts the Docker Compose services in detached mode
up:
	@echo "\033[92m launching...⌛\033[0m"
	$(DC) up -d

down:
	@echo "\033[91mstopping...⌛\033[0m"
	$(DC) down

logs:
	@echo "\033[92mshowing logs...⌛\033[0m"
	$(DC) logs -f
clean:
	@echo "\033[91mcleaning...⌛\033[0m"
	$(DC) down --rmi all

fclean: clean
	$(DC) down --volumes --remove-orphans
	sudo rm -rf ~/data

re: fclean build up

.PHONY: build up down logs