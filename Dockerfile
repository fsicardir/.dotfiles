FROM debian:stable-slim

RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y --no-install-recommends install \
    bash-completion \
    ca-certificates \
    curl \
    less \
    locales \
    tmux

RUN locale-gen en_US.UTF-8

COPY ./common /root
