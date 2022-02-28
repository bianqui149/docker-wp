FROM wordpress:5.9.1-php7.4-apache

# Enable apache mod_header
RUN cd /etc/apache2/mods-enabled/
RUN ln -s /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/headers.load

ARG APACHE_PORT=80

# Enable apache virtualhost for port APACHE_PORT
RUN echo 'Listen ${APACHE_PORT}' >> /etc/apache2/ports.conf

RUN echo '<VirtualHost *:${APACHE_PORT}>' >> /etc/apache2/sites-available/000-default.conf
RUN echo '	ServerAdmin webmaster@localhost' >> /etc/apache2/sites-available/000-default.conf
RUN echo '	DocumentRoot /var/www/html' >> /etc/apache2/sites-available/000-default.conf
RUN echo '	ErrorLog ${APACHE_LOG_DIR}/error.log' >> /etc/apache2/sites-available/000-default.conf
RUN echo '	CustomLog ${APACHE_LOG_DIR}/access.log combined' >> /etc/apache2/sites-available/000-default.conf
RUN echo '</VirtualHost>' >> /etc/apache2/sites-available/000-default.conf

# XDEBUG
RUN pecl install xdebug
RUN echo 'zend_extension="/usr/local/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so"' >> /usr/local/etc/php/conf.d/x-debug.ini

ARG XDEBUG_REMOTE_HOST=0.0.0.0
ARG XDEBUG_REMOTE_PORT=9000

RUN echo 'xdebug.remote_enable=1' >> /usr/local/etc/php/conf.d/x-debug.ini
RUN echo 'xdebug.remote_host=${XDEBUG_REMOTE_HOST}' >> /usr/local/etc/php/conf.d/x-debug.ini
RUN echo 'xdebug.remote_port=${XDEBUG_REMOTE_PORT}' >> /usr/local/etc/php/conf.d/x-debug.ini
RUN echo 'xdebug.remote_connect_back=0' >> /usr/local/etc/php/conf.d/x-debug.ini
RUN echo 'xdebug.remote_autostart=0' >> /usr/local/etc/php/conf.d/x-debug.ini

# BashRC
RUN echo 'alias ll="ls -al"' >> ~/.bashrc

# nano editor tool
RUN apt-get update && apt-get install -y nano

# Volumes
VOLUME /var/www/html/

# Dir creation
# RUN mkdir /var/www/html/
