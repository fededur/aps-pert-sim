 
build:
	docker build -t rmarkdown-renderer .

run:
	mkdir -p output
	docker run --rm -v "${PWD}/output:/workspace/output" rmarkdown-renderer
