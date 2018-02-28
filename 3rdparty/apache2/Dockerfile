FROM bitnami/minideb:stretch

LABEL maintainer "Davi Busanello Ferreira <davi.ferreira@esales.com.br>"

# Set up locales
ENV locale-gen en_US.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8
ENV TZ America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && install_packages apache2 apache2-utils supervisor vim inotify-tools \
    && mkdir -p /var/log/supervisor \
    && mkdir -p /etc/supervisor/conf.d \
    && a2dissite 000-default.conf \
    && a2enmod alias actions proxy_fcgi setenvif rewrite headers
ADD supervisor.conf /etc/supervisor.conf

# Symlink apache access and error logs to stdout/stderr so Docker logs shows them
RUN ln -sf /dev/stdout /var/log/apache2/access.log \
    && ln -sf /dev/stdout /var/log/apache2/other_vhosts_access.log \
    && ln -sf /dev/stderr /var/log/apache2/error.log

COPY reload-config /usr/local/bin/

CMD ["supervisord", "-c", "/etc/supervisor.conf"]
