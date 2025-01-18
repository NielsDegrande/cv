#!/usr/bin/make

## help: Print help.
.PHONY: help
help:
	@echo Possible commands:
	@cat Makefile | grep '##' | grep -v "Makefile" | sed -e 's/^##/  -/'

## build_latex: Build LaTeX image.
build_latex:
	docker build \
		--file "${PWD}"/Dockerfile \
		--tag latex \
		"${PWD}"

## produce_pdf: Produce PDF.
produce_pdf: build_latex
	docker run --rm --volume "${PWD}"/:/app latex
