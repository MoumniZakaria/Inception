FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y && apt install openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/CN=example.com"


COPY  ./conf/nginx.conf /etc/nginx/sites-available/default


# run the command nginx with
# "-g" means "pass a global directive inline"
# daemon -off : Nginx stays in foreground — needed in Docker! to keep the container up 

# You tell Nginx:
    # “Don’t run in the background — stay in the terminal and keep the process open.”
    # This makes sure:
    # Nginx stays alive
    # Docker keeps the container running


CMD [ "nginx", "-g", "daemon off;" ]