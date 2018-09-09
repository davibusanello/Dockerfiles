FROM ruby:2.5-alpine3.7

LABEL mantainer="Davi Busanello <itsme@davibusanello.net>"

ENV locale-gen=en_US.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ=America/Sao_Paulo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apk add --update \
    # Removed after building
    && apk add --virtual .build-deps \
    build-base \
    gcc \
    freetype-dev \
    musl-dev \
    wget \
    curl \
    # Packages permanently add
    && apk add \
    autoconf \
    automake \
    busybox-extras \
    git \
    # Postgres
    libpq \
    nodejs \
    patch \
    # SQlite
    sqlite \
    sqlite-libs \
    tzdata \
    zip \
    # Clear
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

# Point Bundler at /gems. This will cause Bundler to re-use gems that have already been installed on the gems volume
ENV BUNDLE_PATH /gems
ENV BUNDLE_HOME /gems

# Increase how many threads Bundler uses when installing. Optional!
ENV BUNDLE_JOBS 4

# How many times Bundler will retry a gem download. Optional!
ENV BUNDLE_RETRY 3

# Where Rubygems will look for gems, similar to BUNDLE_ equivalents.
ENV GEM_HOME /gems
ENV GEM_PATH /gems

# Add /gems/bin to the path so any installed gem binaries are runnable from bash.
ENV PATH /gems/bin:$PATH

# Add user app
RUN adduser -S app

# Allow SSH keys to be mounted (optional, but nice if you use SSH authentication for git)
VOLUME /root/.ssh

# Setup the directory where we will mount the codebase from the host
VOLUME /app
WORKDIR /app