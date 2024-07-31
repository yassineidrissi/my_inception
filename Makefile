# Makefile for Docker Compose project

# Variables
DC= docker-compose -f srcs/docker-compose.yml

# Targets
build:
	$(DC) build

up:
	$(DC) up -d

down:
	$(DC) down

logs:
	$(DC) logs -f

.PHONY: build up down logs