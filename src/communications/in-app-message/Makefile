.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/in-app-message .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/in-app-message:latest .

docker-run:
	docker run --rm -p 50324:50324 --env-file .env streamvault/in-app-message:latest
