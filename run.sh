#!/bin/bash
mkdir -p output
docker run --rm -v "$(pwd -W)/output:/workspace/output" rmarkdown-renderer


 
