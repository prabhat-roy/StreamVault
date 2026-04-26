.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/live-ingest .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/live-ingest:latest .

docker-run:
	docker run --rm -p 50120:50120 --env-file .env streamvault/live-ingest:latest
