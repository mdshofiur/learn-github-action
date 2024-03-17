# Define variables
DOCKER_IMAGE_NAME := shafikur/frontendnextjs
DOCKER_IMAGE_TAG := 1.0

# DOCKER_IMAGE_NAME := $(DOCKER_USERNAME)/$(DOCKER_REPOSITORY)
# DOCKER_IMAGE_TAG := $(shell git rev-parse --short HEAD)


.PHONY: docker-login build push run clean


docker-login:
	@echo "Docker login..."
	@docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)

build:
	@echo "Docker build..."
	@docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) ./frontend

push:
	@echo "Docker push..."
	@docker push $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)

run:
	@echo "Docker run..."
	@docker run -d -p 8080:80 $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)

clean:
	@echo "Docker clean..."
	@docker rmi $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)
