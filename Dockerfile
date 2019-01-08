FROM multiarch/ubuntu-core:architecture

RUN apt-get update
RUN apt-get install -y g++ cmake libgtest-dev
# Setup GoogleTest
RUN cd /usr/src/googletest \
	&& cmake CMakeLists.txt \
	&& make all \
    && make install
