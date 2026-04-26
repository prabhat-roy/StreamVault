.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/ssai-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/ssai-service:latest .

docker-run:
	docker run --rm -p 50224:50224 --env-file .env streamvault/ssai-service:latest
