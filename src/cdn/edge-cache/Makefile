.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/edge-cache .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/edge-cache:latest .

docker-run:
	docker run --rm -p 50102:50102 --env-file .env streamvault/edge-cache:latest
