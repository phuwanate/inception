FROM debian:12

RUN apt-get update -y && apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/db.sh /

EXPOSE 3306

CMD ["bash", "db.sh"]