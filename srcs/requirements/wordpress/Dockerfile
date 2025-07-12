FROM debian:oldstable

WORKDIR /var/www/html

RUN apt-get update \                 
 && apt-get upgrade -y \             
 && apt-get install -y php-fpm php-mysqli curl

RUN mkdir -p /run/php

RUN sed -i 's|^listen = .*|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/script.sh /usr/script.sh

RUN chmod +x /usr/script.sh

CMD [ "/usr/script.sh" ]

# Create the directory where the PHP-FPM socket file will be placed
# Without this directory, PHP-FPM will fail to start because it cannot bind to the socket
# -p means "create parent directories as needed" (no error if directory already exists)

# CMD defines the default command that will run when the container starts
# CMD [ "php-fpm7.4", "-F" ]
# "php-fpm7.4" is the binary to run the PHP FastCGI Process Manager
# "-F" flag means "run in the foreground" (do not daemonize), which is necessary for Docker containers