FROM ruby:2.5-slim-stretch

LABEL mantainer="Davi Busanello <itsme@davibusanello.net>"

ENV locale-gen=en_US.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ=America/Sao_Paulo

EXPOSE 3000

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get update && apt-get install -y autoconf build-essential automake \
    git \
    libpq-dev \
    libsqlite3-dev \
    nodejs \
    patch \
    sqlite3 \
    tzdata \
    telnet \
    zip \
    # Clear
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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

# Allow SSH keys to be mounted (optional, but nice if you use SSH authentication for git)
VOLUME /root/.ssh

# Setup the directory where we will mount the codebase from the host
VOLUME /app
WORKDIR /app
