FROM debian:12

RUN apt-get update

RUN apt-get install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/conf.d/
COPY ./tools/nginx.sh /

EXPOSE 443

CMD ["bash", "nginx.sh"]
