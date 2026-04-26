.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/payment-gateway .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/payment-gateway:latest .

docker-run:
	docker run --rm -p 50181:50181 --env-file .env streamvault/payment-gateway:latest
