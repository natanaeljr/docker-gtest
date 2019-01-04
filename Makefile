TARGET ?= x86_64
CI_COMMIT_REF_SLUG ?= latest
TAG ?= $(CI_COMMIT_REF_SLUG)


build: tmp-$(TARGET)/Dockerfile
	docker build --no-cache -t natanaeljr/gtest:$(TARGET)-$(TAG) tmp-$(TARGET)
	docker run --rm natanaeljr/gtest:$(TARGET)-$(TAG) uname -a


tmp-$(TARGET)/Dockerfile: Makefile Dockerfile $@
	rm -rf tmp-$(TARGET)
	mkdir tmp-$(TARGET)
	cp Dockerfile $@
	cp setup-gtest.sh tmp-$(TARGET)
	sed -i "1s/architecture/$(TARGET)-bionic/" $@
	cat $@
