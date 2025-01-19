#!/bin/bash

# Ensure Docker is running
if ! docker info > /dev/null 2>&1; then
  echo "Error: Docker is not running. Please start Docker Desktop and try again."
  exit 1
fi

# Pull the latest changes from the repository
echo "Pulling the latest changes from the repository..."
if ! git pull origin main; then
  echo "Error: Failed to pull the latest changes. Make sure this is a Git repository."
  exit 1
fi

# Build the Docker image
echo "Building the Docker image..."
if ! docker build --no-cache -t rmarkdown-renderer .; then
  echo "Error: Docker build failed."
  exit 1
fi

# Ensure the output directory exists
mkdir -p output

# Render the document using Docker
echo "Rendering the document..."
if ! docker run --rm -v "$(pwd)/output:/workspace/output" rmarkdown-renderer; then
  echo "Error: Docker run failed."
  exit 1
fi

echo "Rendering complete. The output HTML can be found in the 'output' folder."

 
