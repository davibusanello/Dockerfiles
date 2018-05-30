FROM ruby:2.5-slim-stretch

LABEL mantainer="Davi Busanello <itsme@davibusanello.net>"

ENV locale-gen=en_US.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ=America/Sao_Paulo

EXPOSE 3000

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get update && apt-get install -y build-essential automake autoconf \
    patch sqlite3 zip git


