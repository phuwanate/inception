FROM debian:12.5

RUN apt-get update && apt install curl -y && apt install mariadb-client -y

RUN apt-get -y install wget \
php \
php-cgi \
php-pdo \
php-gd php-cli \
php-mbstring

RUN apt install php-fpm php-mysql -y

COPY ./tools/wp.sh /

COPY ./conf/wp-config.php /

EXPOSE 9000

CMD ["bash", "wp.sh"]