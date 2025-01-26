#!/bin/bash

# Define image name
IMAGE_NAME="aps_pert_sim_image"

# Build the Docker image
docker build -t $IMAGE_NAME .

# Run the Docker container with corrected path handling for Windows
docker run --rm -v "$(pwd -W):/project" -w "//project" $IMAGE_NAME

# Clean up Docker image
docker rmi $IMAGE_NAME

echo "Report generation complete! Check the 'output' directory."
