FROM debian:bookworm

RUN apt update

RUN apt install wordpress php8.2 php8.2-fpm mariadb-client -y 

RUN apt install curl -y 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000
COPY ./tools/stup_wp.sh .
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

RUN chmod +x stup_wp.sh

CMD ["./stup_wp.sh"]

# CMD ["php-fpm8.2", "-F"]