# Use the official Debian base image, specifically the "oldstable" version (Debian 11 "Bullseye")
FROM debian:oldstable

WORKDIR /var/www/html

# RUN executes commands inside the container during the image build stage
RUN apt-get update \                 
# Update the list of available packages from Debian repositories
 && apt-get upgrade -y \             
# Upgrade all installed packages to the latest versions (-y means yes to all prompts)
 && apt-get install -y php-fpm php-mysqli curl
# Install PHP-FPM (FastCGI Process Manager) - version 7.4 on Debian 11 by default 
# (This line is duplicated and unnecessary – installs php-fpm again)



# RUN mkdir -p /var/www/html
RUN mkdir -p /run/php



COPY  ./conf/wordpress.conf /etc/php/7.4/fpm/pool.d/www.conf

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
