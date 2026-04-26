.PHONY: build test run clean docker-build docker-run

build:
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
	cmake --build build -j

test:
	@echo "(audio-service tests are added in subsequent waves)"

run: build
	./build/audio_service

clean:
	rm -rf build

docker-build:
	docker build -t streamvault/audio-service:latest .

docker-run:
	docker run --rm -p 50023:50023 --env-file .env streamvault/audio-service:latest
