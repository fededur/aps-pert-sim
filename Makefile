# Build the Docker image
build:
	docker build --no-cache -t rmarkdown-renderer .

# Run the container to render the document
run:
	mkdir -p output
	docker run --rm -v "$(pwd)/output:/workspace/output" rmarkdown-renderer

# Pull updates from the repository (optional step)
pull:
	git pull origin simplify-workflow
