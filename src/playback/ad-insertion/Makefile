.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/ad-insertion .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/ad-insertion:latest .

docker-run:
	docker run --rm -p 50163:50163 --env-file .env streamvault/ad-insertion:latest
