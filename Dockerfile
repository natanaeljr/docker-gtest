FROM multiarch/ubuntu-core:architecture

RUN apt-get update
RUN apt-get install -y g++ cmake libgtest-dev
COPY ./setup-gtest.sh /usr/src/setup-gtest.sh
RUN ["/usr/src/setup-gtest.sh"]

VOLUME /app
WORKDIR /app

CMD /bin/bash
