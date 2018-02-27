FROM bitnami/minideb:stretch

LABEL maintainer "Davi Busanello Ferreira <davi.ferreira@esales.com.br>"

# Set up locales
ENV locale-gen en_US.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8
ENV TZ America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN install_packages apache2 apache2-utils vim && a2dissite 000-default.conf
# libapache2-mod-fastcgi

# Enable additional configs and mods
# RUN ln -s $HTTPD_PREFIX/mods-available/expires.load $HTTPD_PREFIX/mods-enabled/expires.load \
#     && ln -s $HTTPD_PREFIX/mods-available/headers.load $HTTPD_PREFIX/mods-enabled/headers.load \
# 	&& ln -s $HTTPD_PREFIX/mods-available/rewrite.load $HTTPD_PREFIX/mods-enabled/rewrite.load

RUN a2enmod alias actions proxy_fcgi setenvif rewrite headers

# Symlink apache access and error logs to stdout/stderr so Docker logs shows them
RUN ln -sf /dev/stdout /var/log/apache2/access.log
RUN ln -sf /dev/stdout /var/log/apache2/other_vhosts_access.log
RUN ln -sf /dev/stderr /var/log/apache2/error.log
# CMD ["apache2ctl", "-D", "FOREGROUND"]
