TARGET_ARCH ?= x86_64
CONTAINER_TAG ?= latest
CONTAINER_IMAGE ?= natanaeljr/gtest
CONTATINER_CACHE_FROM ?=


build: build-$(TARGET_ARCH)/Dockerfile
	docker build $(CONTATINER_CACHE_FROM:%=--cache-from %) -t $(CONTAINER_IMAGE):$(TARGET_ARCH)-$(CONTAINER_TAG) build-$(TARGET_ARCH)
	docker run --rm $(CONTAINER_IMAGE):$(TARGET_ARCH)-$(CONTAINER_TAG) uname -a


build-$(TARGET_ARCH)/Dockerfile: Makefile Dockerfile $@
	rm -rf build-$(TARGET_ARCH)
	mkdir build-$(TARGET_ARCH)
	cp Dockerfile $@
	cp setup-gtest.sh build-$(TARGET_ARCH)
	sed -i "1s/architecture/$(TARGET_ARCH)-bionic/" $@
	cat $@
