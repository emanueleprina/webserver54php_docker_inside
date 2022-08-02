FROM orsolin/docker-php-5.3-apache

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    PATH=/root/.composer/vendor/bin:$PATH
    

WORKDIR /var/www/html

RUN a2enmod speling \
 && apt-get update \
 && apt-get -y install cron nano wget 

# Copy cron file to the cron.d directory
COPY cron.web /etc/cron.d/cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cron

#install docker inside container
RUN curl -fsSL https://get.docker.com | sh
RUN apt-get install docker-ce



# Apply cron job
RUN crontab /etc/cron.d/cron

# Create the log file to be able to run tail
RUN mkdir -p /var/log/cron

COPY php.ini /etc/php5/apache2/conf.d/php.ini
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY apache2.conf /etc/apache2/apache2.conf
COPY vtiger-ssl.* /etc/apache2/ssl/
RUN mkdir -p /var/www/html/vtiger

WORKDIR /app

# Add a command to base-image entrypont scritp
RUN sed -i 's/^exec /service cron start\n\nexec /' /usr/local/bin/apache2-foreground
