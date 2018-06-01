FROM ruby:2.5-slim-stretch

LABEL mantainer="Davi Busanello <itsme@davibusanello.net>"

ENV locale-gen=en_US.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8 //\
    LC_ALL=C.UTF-8 \
    TZ=America/Sao_Paulo

EXPOSE 3000

# Remove de unnecessary packages before build
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
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir /app

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
