 
build:
	docker build -t rmarkdown-renderer .

run:
	mkdir -p output
	docker run --rm -v "$(pwd -W)/output:/workspace/output" rmarkdown-renderer
