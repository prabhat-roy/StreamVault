.PHONY: build test run package docker-build

build:
	mvn -B compile

test:
	mvn -B test

run:
	mvn -B spring-boot:run

package:
	mvn -B package -DskipTests

docker-build: package
	docker build -t streamvault/rights-management:latest .

docker-run:
	docker run --rm -p 50012:50012 --env-file .env streamvault/rights-management:latest
