# Build an image that serves as a starting point for many projects that use
# this particular stack.

FROM alpine:3.7

MAINTAINER Kat Chuang <katychuang@gmail.com>

ENV ALPINE_VERSION=3.7

RUN apk --update add python rsync openssh

ENV BUNDLER_VERSION 1.12.3
RUN \
  apk --update add ruby ruby-io-console ruby-irb ruby-json ruby-rake ruby-rdoc  && \
  gem install bundler -v "$BUNDLER_VERSION" --no-document && \
  bundle config --global silence_root_warning 1 && \
  mkdir /app
