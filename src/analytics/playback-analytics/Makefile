.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/playback-analytics .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t streamvault/playback-analytics:latest .

docker-run:
	docker run --rm -p 50301:50301 --env-file .env streamvault/playback-analytics:latest
