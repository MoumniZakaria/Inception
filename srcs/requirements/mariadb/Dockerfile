FROM debian:oldstable

RUN apt-get update && \
    apt-get install mariadb-server mariadb-client -y

RUN		sed -i "s|127.0.0.1|0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld && \
    chown mysql:mysql /run/mysqld && \
    chmod 755 /run/mysqld

COPY ./scripts/setup.sh  /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

CMD [ "/usr/local/bin/setup.sh"]