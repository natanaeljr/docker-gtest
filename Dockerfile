FROM multiarch/ubuntu-core:architecture

RUN apt-get update
RUN apt-get install -y g++ cmake libgtest-dev
# Setup GoogleTest
RUN cd /usr/src/googletest \
	&& cmake CMakeLists.txt \
	&& make \
	&& cd googlemock \
	&& cp libgmock.a libgmock_main.a gtest/libgtest.a gtest/libgtest_main.a /usr/lib
