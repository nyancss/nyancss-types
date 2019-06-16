.DEFAULT_GOAL := build
.PHONY: build

SHELL := /bin/bash
PATH := $(shell yarn bin):$(PATH)

build:
	@rm -rf lib
	@tsc
	@prettier "lib/**/*.[jt]s" --write --loglevel silent
	@cp {package.json,*.md} lib

publish: build
	cd lib && npm publish --access public