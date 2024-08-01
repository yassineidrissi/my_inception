FROM debian:bookworm

RUN apt update

RUN apt install php8.2 php8.2-fpm php-mysqli -y 

RUN apt install curl unzip -y 

RUN curl -O https://wordpress.org/latest.zip && \
	# apt install unzip -y && \
	unzip latest.zip && \
	mkdir -p /var/www/html &&\
	mv wordpress/* /var/www/html/
	# chown -R www-data:www-data /var/www/html/ && \
	# chmod -R 755 /var/www/html/


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000
COPY ./tools/stup_wp.sh .
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/
COPY ./conf/wp-config.php .
RUN chmod +x stup_wp.sh

CMD ["./stup_wp.sh"]

# CMD ["php-fpm8.2", "-F"]