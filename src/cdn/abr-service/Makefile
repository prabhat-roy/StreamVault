.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/abr-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/abr-service:latest .

docker-run:
	docker run --rm -p 50104:50104 --env-file .env streamvault/abr-service:latest
