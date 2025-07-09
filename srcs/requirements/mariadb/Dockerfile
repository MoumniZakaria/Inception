FROM debian:oldstable

RUN apt-get update && \
    apt-get install mariadb-server -y

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld

# COPY ./scripts/init.sql /etc/mysql/init.sql 

COPY ./scripts/setup.sh  ./setup.sh

RUN chmod +x ./setup.sh

RUN ./setup.sh

# CMD [ "mysqld"]