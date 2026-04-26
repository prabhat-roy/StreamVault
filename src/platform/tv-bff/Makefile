.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/tv-bff .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/tv-bff:latest .

docker-run:
	docker run --rm -p 50003:50003 --env-file .env streamvault/tv-bff:latest
