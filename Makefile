TARGET ?= x86_64

build: tmp-$(TARGET)/Dockerfile
	docker build --no-cache -t natanaeljr/gtest:$(TARGET)-latest tmp-$(TARGET)
	docker run --rm natanaeljr/gtest:$(TARGET)-latest uname -a


tmp-$(TARGET)/Dockerfile: Dockerfile $@
	rm -rf tmp-$(TARGET)
	mkdir tmp-$(TARGET)
	cp Dockerfile $@
	cp setup-gtest.sh tmp-$(TARGET)
	sed -i "1s/architecture/$(TARGET)-xenial/" $@
	cat $@
