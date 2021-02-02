FROM ubuntu:16.04
MAINTAINER arrange2p <sunstyleweb@gmail.com>

RUN apt-get update
RUN apt-get -y install apache2 php libapache2-mod-php7.0 php7.0-zip php-mcrypt php-mbstring php-gd php-curl php-xml php-mysql\
    curl git vim openssl mysql-client openssh-server openssh-client

#create user and laravel setup
RUN groupadd devtest
RUN useradd -g devtest -ms /bin/bash dev1

#php composer install
RUN mkdir -p /data/laravel
RUN chown dev1:devtest /data/laravel

WORKDIR /data/laravel
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/
RUN ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

USER dev1
RUN composer global require "laravel/installer"

USER root

#apche2 config
RUN rm /etc/apache2/sites-enabled/000-default.conf
RUN rm /etc/apache2/sites-available/000-default.conf

ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
ADD entrypoint.sh /home/dev1

RUN ln -s /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-enabled/000-default.conf

RUN chmod +x /home/dev1/entrypoint.sh
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf 

EXPOSE 80 443
ENTRYPOINT /home/dev1/entrypoint.sh

ㅇㄹㄴㅇ
ㄹㅇㄴ
ㄹㅇㄴㄹㅇㄴ
ㄹ
