FROM ubuntu:focal

LABEL maintainer="John Ernsthausen" \
      description="C++ setup with gtest and gmock" \
      version="0.1.0"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
RUN apt-get update -y && \
    apt-get install -y tzdata

RUN apt-get install -y --no-install-recommends\
                    git \
                    curl \
                    gcc-9 \
                    g++ \
                    clang-10 \
                    build-essential \
                    cmake \
                    unzip \
                    tar \
                    libgtest-dev \
                    google-mock \
                    libblas-dev \
                    liblapack-dev \
                    ca-certificates && \
    apt-get autoclean && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ls -la /usr/src
WORKDIR /usr/src/gmock
RUN mkdir build
WORKDIR /usr/src/gmock/build
RUN cmake -DBUILD_SHARED_LIBS=ON -Dgmock_build_samples=ON -G"Unix Makefiles" ..
RUN make
RUN cp -r ../include/gmock /usr/local/include/
RUN ls -la lib
RUN cp lib/lib*.so /usr/local/lib
WORKDIR /usr/src/gmock
RUN rm -rf build
RUN mkdir build
WORKDIR /usr/src/gmock/build
RUN cmake ..
RUN make
RUN ls -la lib
RUN cp lib/lib*.a /usr/local/lib

WORKDIR /usr/src/gtest
RUN mkdir build
WORKDIR /usr/src/gtest/build
RUN cmake -DBUILD_SHARED_LIBS=ON -Dgtest_build_samples=ON -G"Unix Makefiles" ..
RUN make
RUN cp -r ../include/gtest /usr/local/include/
RUN ls -la lib
RUN cp lib/lib*.so /usr/local/lib
WORKDIR /usr/src/gtest
RUN rm -rf build
RUN mkdir build
WORKDIR /usr/src/gtest/build
RUN cmake ..
RUN make
RUN ls -la lib
RUN cp lib/lib*.a /usr/local/lib
