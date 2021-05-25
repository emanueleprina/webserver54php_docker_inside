#!/usr/bin/env bash

a2enmod speling
apt-get update 
apt-get -y install cron nano wget
mv apache2.conf /etc/apache2/apache2.conf 
mv vtigercron.sh /var/www/html/vtiger/vtigerst/cron/vtigercron.sh
mv vtigercron.sh /var/www/html/vtiger/vtigerqa/cron/vtigercron.sh
