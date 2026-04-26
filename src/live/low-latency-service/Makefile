.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/low-latency-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/low-latency-service:latest .

docker-run:
	docker run --rm -p 50123:50123 --env-file .env streamvault/low-latency-service:latest
