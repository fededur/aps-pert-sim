#!/bin/bash

# Define image and container names
IMAGE_NAME="aps_pert_sim_image"
CONTAINER_NAME="aps_pert_sim_container"

# Build the Docker image
docker build -t $IMAGE_NAME .

# Run the Docker container
docker run --name $CONTAINER_NAME -v "$(pwd):/project" $IMAGE_NAME

# Copy the generated report to the host
docker cp $CONTAINER_NAME:/project/output/aps-pert-simulation.html ./output/

# Clean up: remove container and image
docker rm $CONTAINER_NAME
docker rmi $IMAGE_NAME
