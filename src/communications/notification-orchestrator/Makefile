.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/notification-orchestrator .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/notification-orchestrator:latest .

docker-run:
	docker run --rm -p 50320:50320 --env-file .env streamvault/notification-orchestrator:latest
