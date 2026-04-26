.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/ingest-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/ingest-service:latest .

docker-run:
	docker run --rm -p 50010:50010 --env-file .env streamvault/ingest-service:latest
