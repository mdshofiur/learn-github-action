# Define variables
DOCKER_IMAGE_NAME := my-docker-image
DOCKER_IMAGE_TAG := latest



.PHONY: docker-login build push run clean


docker-login:
	@echo "Docker login..."
	@docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)

build:
	@echo "Docker build..."
	@docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) .

push: docker-login
	@echo "Docker push..."
	@docker push $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)

run:
	@echo "Docker run..."
	@docker run -d -p 8080:80 $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)

clean:
	@echo "Docker clean..."
	@docker rmi $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)
