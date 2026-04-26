.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/watch-party-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/watch-party-service:latest .

docker-run:
	docker run --rm -p 50263:50263 --env-file .env streamvault/watch-party-service:latest
