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

RUN ls -la /usr/include/gmock
RUN ls -la /usr/include/gtest

RUN mkdir /usr/local/include/gtest
RUN cp -r /usr/include/gtest /usr/local/include/gtest

RUN mkdir /usr/local/include/gmock
RUN cp -r /usr/include/gmock /usr/local/include/gmock

RUN cp /usr/lib/x86_64-linux-gnu/libgmock*.a /usr/local/lib
RUN cp /usr/lib/x86_64-linux-gnu/libgtest*.a /usr/local/lib
