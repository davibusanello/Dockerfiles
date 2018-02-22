FROM bitnami/minideb:stretch

LABEL maintainer "Davi Busanello Ferreira <davi.ferreira@esales.com.br>"

ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US:en 
ENV LC_ALL en_US.UTF-8

RUN install_packages php7.0-fpm php-pecl-http php7.0-xdebug

COPY --from=composer:1.6 /usr/bin/composer /usr/bin/composer

EXPOSE 9009