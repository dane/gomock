DOCKER = $(if $(shell which podman), podman, docker)
VERSION = $(shell cat VERSION)

.PHONY: all
all: tag build release

.PHONY: tag
tag:
	git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' https://github.com/golang/mock.git | tail -n 1 | cut -d '/' --field 3 > VERSION

.PHONY: build
build:
	${DOCKER} build -t ghcr.io/dane/gomock:${VERSION} --build-arg GOMOCK_VERSION=${VERSION} -f Dockerfile

.PHONY: release
release:
	${DOCKER} push ghcr.io/dane/gomock:${VERSION}
