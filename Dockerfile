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
                    libgmock-dev \
                    libblas-dev \
                    liblapack-dev \
                    ca-certificates && \
    apt-get autoclean && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/gtest
RUN ls -la
RUN mkdir build
WORKDIR /usr/src/gtest/build
RUN cmake -DBUILD_SHARED_LIBS=ON -Dgtest_build_samples=ON -G"Unix Makefiles" ..
RUN make
RUN ls -la ../include
RUN cp -r ../include/gtest /usr/local/include/
RUN cp lib*.so /usr/local/lib

