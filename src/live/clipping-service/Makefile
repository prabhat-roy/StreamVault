.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/clipping-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/clipping-service:latest .

docker-run:
	docker run --rm -p 50124:50124 --env-file .env streamvault/clipping-service:latest
