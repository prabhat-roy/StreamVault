.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/studio-dashboard .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/studio-dashboard:latest .

docker-run:
	docker run --rm -p 50201:50201 --env-file .env streamvault/studio-dashboard:latest
