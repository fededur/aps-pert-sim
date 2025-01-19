#!/bin/bash

# Ensure Docker is running
if ! docker info > /dev/null 2>&1; then
  echo "Error: Docker is not running. Please start Docker Desktop and try again."
  exit 1
fi

# Create the local output directory
mkdir -p output

# Get the absolute path for the current directory (Windows-compatible)
PROJECT_PATH=$(pwd -W)  # Converts to Windows-style path
OUTPUT_PATH="$PROJECT_PATH/output"

# Run the container with correct paths
docker run --rm -v "$OUTPUT_PATH:/workspace/output" rmarkdown-renderer

