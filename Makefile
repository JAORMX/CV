IMAGE_NAME?=cv-builder
TAG?=latest

CONTAINER_NAME=cvbuilder

OUTPUT_FILE=cv-jaosorior.pdf

.PHONY: container-image
container-image:
	podman build -t $(IMAGE_NAME):$(TAG) -f Containerfile .

.PHONY: cv
cv:
	@cp CurriculumEN.tex tmp.tex
	podman run -v ./tmp.tex:/tmp.tex:ro,z --name=$(CONTAINER_NAME) cv-builder:latest pdflatex /tmp.tex
	@rm tmp.tex
	@podman cp $(CONTAINER_NAME):/tmp.pdf $(OUTPUT_FILE)
	@podman rm $(CONTAINER_NAME)
	@echo "the CV is available in $(OUTPUT_FILE)"
