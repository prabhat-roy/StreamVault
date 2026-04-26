.PHONY: build test run docker-build docker-run

build:
	gradle classes

test:
	gradle test

run:
	gradle bootRun

bootJar:
	gradle bootJar

docker-build: bootJar
	docker build -t streamvault/metadata-service:latest .

docker-run:
	docker run --rm -p 50011:50011 --env-file .env streamvault/metadata-service:latest
