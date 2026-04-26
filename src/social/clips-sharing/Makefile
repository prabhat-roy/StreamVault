.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/clips-sharing .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/clips-sharing:latest .

docker-run:
	docker run --rm -p 50264:50264 --env-file .env streamvault/clips-sharing:latest
