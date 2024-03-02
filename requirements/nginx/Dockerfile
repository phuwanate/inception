FROM debian:12.5

RUN apt-get update && apt-get install nginx -y && apt install openssl -y

COPY ./conf/default.conf /etc/nginx/conf.d/

COPY ./tools/script.sh /

CMD ["bash", "script.sh"]

