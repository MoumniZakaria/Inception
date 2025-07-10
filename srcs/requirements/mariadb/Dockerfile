FROM debian:oldstable

RUN apt-get update && \
    apt-get install mariadb-server mariadb-client -y

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql
# COPY ./scripts/init.sql /etc/mysql/init.sql 

COPY ./scripts/setup.sh  /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh


CMD [ "/usr/local/bin/setup.sh"]