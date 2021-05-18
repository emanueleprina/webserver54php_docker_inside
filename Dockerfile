FROM orsolin/docker-php-5.3-apache

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    PATH=/root/.composer/vendor/bin:$PATH
    

WORKDIR /var/www/html

RUN a2enmod speling \
 && apt-get update \
 && apt-get -y install cron nano wget
 
COPY php.ini /etc/php5/apache2/conf.d/php.ini
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY apache2.conf /etc/apache2/apache2.conf
COPY vtiger-ssl.* /etc/apache2/ssl/

RUN mkdir -p /var/www/html/vtiger
RUN service apache2 start


WORKDIR /app

