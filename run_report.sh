#!/bin/bash

# Define image and container names
IMAGE_NAME="aps_pert_sim_image"
CONTAINER_NAME="aps_pert_sim_container"

# Build the Docker image
docker build -t $IMAGE_NAME .

# Run the Docker container and map the project directory
docker run --name $CONTAINER_NAME -v "$(pwd):/project" $IMAGE_NAME

# Ensure the output directory exists locally
mkdir -p output

# Copy the report from the container to the local 'output' directory
docker cp $CONTAINER_NAME:/project/output/aps-pert-simulation.html ./output/

# Clean up Docker container and image
docker rm $CONTAINER_NAME
docker rmi $IMAGE_NAME

echo "Report generation complete! Check the 'output' directory."

