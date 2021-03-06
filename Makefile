TARGET_ARCH ?= x86_64
CONTAINER_TAG ?= latest
CONTAINER_IMAGE ?= natanaeljr/gtest
CONTAINER_CACHE_FROM ?=

.PHONY: build test

build: build/$(TARGET_ARCH)/Dockerfile
	docker build $(CONTAINER_CACHE_FROM:%=--cache-from %) -t $(CONTAINER_IMAGE):$(TARGET_ARCH)-$(CONTAINER_TAG) build/$(TARGET_ARCH)
	docker run --rm $(CONTAINER_IMAGE):$(TARGET_ARCH)-$(CONTAINER_TAG) uname -a


build/$(TARGET_ARCH)/Dockerfile: Makefile Dockerfile $@
	mkdir -p build/$(TARGET_ARCH)
	cp Dockerfile $@
	sed -i "1s/architecture/$(TARGET_ARCH)-bionic/" $@
	cat $@

test:
	docker run --name test --rm -v "$(shell pwd)/test":/app $(CONTAINER_IMAGE):$(TARGET_ARCH)-$(CONTAINER_TAG) \
		bin/sh -c "cd app && ./run_test.sh"
