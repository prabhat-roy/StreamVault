.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/web-bff .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/web-bff:latest .

docker-run:
	docker run --rm -p 50001:50001 --env-file .env streamvault/web-bff:latest
