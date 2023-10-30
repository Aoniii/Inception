FROM debian:buster

EXPOSE 9000

RUN apt-get update -y
RUN apt-get install php7.3 php-mysqli php-fpm mariadb-client curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update

RUN mkdir -p /run/php/
RUN mkdir -p /var/www/html

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/wp.sh ./

RUN chmod +x ./wp.sh

ENTRYPOINT ["./wp.sh"]
