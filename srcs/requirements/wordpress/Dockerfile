FROM debian:12

RUN apt-get update && apt install curl -y && apt install mariadb-client -y

RUN apt-get -y install wget \
php \
php-cgi \
php-pdo \
php-gd php-cli \
php-mbstring \
php-fpm \
php-mysql

COPY ./tools/wp.sh /

COPY ./conf/wp-config.php /

EXPOSE 9000

CMD ["bash", "wp.sh"]