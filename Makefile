FILE = ./srcs/docker-compose.yml

all: build up

build:
	mkdir -p /home/snourry/data/mariadb/
	mkdir -p /home/snourry/data/wordpress/
	docker compose -f $(FILE) build

up:
	docker compose -f $(FILE) up -d

stop: down
	rm -rf /home/snourry/data/mariadb/
	rm -rf /home/snourry/data/wordpress/

down:
	docker compose -f $(FILE) down

.PHONY: all build up stop down
