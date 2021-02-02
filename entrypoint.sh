#!/bin/sh

/home/dev1/.composer/vendor/bin/laravel new

a2enmod rewrite

#백그라운드 실행
apachectl -D FOREGROUND
