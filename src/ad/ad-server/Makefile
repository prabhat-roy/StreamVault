.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/ad-server .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/ad-server:latest .

docker-run:
	docker run --rm -p 50220:50220 --env-file .env streamvault/ad-server:latest
