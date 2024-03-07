FROM debian:12

RUN apt-get update && apt-get install nginx -y && apt install openssl -y

COPY ./conf/nginx.conf /etc/nginx/conf.d/
COPY ./tools/script.sh /

EXPOSE 443

CMD ["bash", "script.sh"]
