FROM debian:oldstable

RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server -y && apt-get install mariadb-client -y

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld

COPY ./scripts/init.sql /etc/mysql/init.sql 

CMD [ "mysqld"]