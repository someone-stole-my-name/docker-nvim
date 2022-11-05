FROM alpine:latest

ARG NEOVIM_VERSION=v0.8.0

WORKDIR /tmp/nvim

RUN apk --no-cache add \
  autoconf \
  automake \
  bash \
  build-base \
  cargo \
  cmake \
  coreutils \
  curl \
  gettext-tiny-dev \
  git \
  libarchive-tools \
  libtool \
  make \
  npm \
  perl \
  perl-json-xs \
  perl-lwp-protocol-https \
  pkgconf \
  rust \
  unzip

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN git clone --depth 1 --branch ${NEOVIM_VERSION} https://github.com/neovim/neovim && \
  cd neovim && \
  make CMAKE_BUILD_TYPE=Release && \
  make install
