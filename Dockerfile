FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
	build-essential \
	cmake \
	git \
	wget \
	unzip \
	vim \
	libboost-all-dev \
	libdeal.ii-dev \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip \
    && unzip yaml-cpp-0.6.3.zip \
    && cd yaml-cpp-yaml-cpp-0.6.3 \
    && mkdir build && cd build \
    && cmake -DYAML_BUILD_SHARED_LIBS=ON .. \
    && make install \
    && cd /tmp \
    && rm -rf yaml-cpp-yaml-cpp-0.6.3 yaml-cpp-0.6.3.zip

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

WORKDIR /cmake-exercise
COPY . .
