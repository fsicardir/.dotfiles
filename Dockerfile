FROM debian:stable-slim

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y --no-install-recommends install \
    bash-completion \
    ca-certificates \
    curl \
    less \
    locales \
    procps \
    python3 \
    tmux \
    vim

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

COPY ./common /root
