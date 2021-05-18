#!/usr/bin/env bash

a2enmod speling
apt-get update 
apt-get -y install cron nano wget
mv apache2.conf /etc/apache2/apache2.conf 
 