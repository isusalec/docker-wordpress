#!make
include .env

build-no-cache:
	clear
	docker-compose down
	docker-compose build --no-cache
	docker-compose up -d --remove-orphans > build-no-cache.log
	docker-compose ps

build:
	clear
	docker-compose down
	docker-compose up -d --build > build.log
	docker-compose ps

config:
	docker-compose config

ssh:
	docker exec -i -t ${PROJECT_NAME}-web /bin/bash
