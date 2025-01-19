#!/bin/bash

# Ensure Docker is running
if ! docker info > /dev/null 2>&1; then
  echo "Error: Docker is not running. Please start Docker Desktop and try again."
  exit 1
fi

# Create the local output folder
mkdir -p output

# Run the container and mount the local output folder
docker run --rm -v "$(pwd)/output:/workspace/output" rmarkdown-renderer





 
