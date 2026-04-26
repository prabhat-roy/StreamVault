.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/forensic-tracker .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/forensic-tracker:latest .

docker-run:
	docker run --rm -p 50082:50082 --env-file .env streamvault/forensic-tracker:latest
