FROM alpine:latest

ARG NEOVIM_VERSION=v0.8.0

WORKDIR /tmp/nvim

RUN apk --no-cache add \
  autoconf \
  automake \
  bash \
  build-base \
  cmake \
  coreutils \
  curl \
  gettext-tiny-dev \
  git \
  libtool \
  pkgconf \
  unzip

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN git clone --depth 1 --branch ${NEOVIM_VERSION} https://github.com/neovim/neovim && \
  cd neovim && \
  make CMAKE_BUILD_TYPE=Release && \
  make install
