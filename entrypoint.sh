#!/bin/sh

/home/dev1/.composer/vendor/bin/laravel new

a2enmod rewrite

apachectl -D FOREGROUND

