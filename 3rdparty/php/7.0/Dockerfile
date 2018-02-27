FROM bitnami/minideb:stretch

LABEL maintainer "Davi Busanello Ferreira <davi.ferreira@esales.com.br>"

# Set up locales
ENV locale-gen=en_US.UTF-8 \
	LANG=C.UTF-8 \
	LANGUAGE=C.UTF-8 \
	LC_ALL=C.UTF-8 \
	TZ=America/Sao_Paulo \
	COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME="/root/.composer" \
    COMPOSER_CACHE_DIR="/root/.composer/cache"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN install_packages php7.0-fpm php-pecl-http php7.0-xdebug mcrypt \
	php7.0-gd curl php7.0-curl php7.0-mbstring sendmail php7.0-cli \
    php7.0-bz2 php7.0-gd php7.0-gmp php7.0-imap php7.0-intl \
    php7.0-json php7.0-ldap php7.0-mbstring php7.0-mcrypt php7.0-mysql \
    php7.0-odbc php7.0-opcache php7.0-pgsql php7.0-phpdbg php7.0-pspell \
    php7.0-readline php7.0-recode php7.0-soap php7.0-sqlite3 \
    php7.0-tidy php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-zip vim

COPY php-fpm/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
COPY php-fpm/pool.d/www.conf  /etc/php/7.0/fpm/pool.d/www.conf
# RUN mkdir -p /var/www/html

COPY --from=composer:1.6 /usr/bin/composer /usr/bin/composer

COPY docker-php-entrypoint /usr/local/bin/docker-php-entrypoint
ENTRYPOINT ["docker-php-entrypoint"]

WORKDIR /var/www/html
# RUN sed -i "s/display_errors = Off/display_errors = On/" /etc/php/7.0/fpm/php.ini

RUN ln -sf /dev/stderr /var/log/php_errors.log

# EXPOSE 9009
EXPOSE 9000
CMD ["php-fpm7.0"]