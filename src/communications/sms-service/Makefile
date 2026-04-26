.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/sms-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/sms-service:latest .

docker-run:
	docker run --rm -p 50323:50323 --env-file .env streamvault/sms-service:latest
