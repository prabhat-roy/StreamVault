.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/continue-watching .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/continue-watching:latest .

docker-run:
	docker run --rm -p 50241:50241 --env-file .env streamvault/continue-watching:latest
