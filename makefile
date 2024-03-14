# Define variables
DOCKER_IMAGE_NAME := my-docker-image
DOCKER_IMAGE_TAG := latest


.PHONY: all build run clean

# Default target
all: build

# Build the Docker image
build:
    docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) .

# Push the Docker image to a registry
push:
    docker push $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)

# Run the Docker container
run:
    docker run -d -p 8080:80 $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)

# Remove the Docker image
clean:
    docker rmi $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)
