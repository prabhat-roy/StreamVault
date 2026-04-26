.PHONY: build test run clean docker-build docker-run

build:
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
	cmake --build build -j

test:
	@echo "(transcoding-service tests are added in subsequent waves)"

run: build
	./build/transcoding_service

clean:
	rm -rf build

docker-build:
	docker build -t streamvault/transcoding-service:latest .

docker-run:
	docker run --rm -p 50020:50020 --env-file .env streamvault/transcoding-service:latest
