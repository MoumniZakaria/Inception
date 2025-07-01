# Start with Debian 11 (bullseye) as our base operating system
# Why Debian bullseye? It's the "penultimate stable version" required by the subject
# Think of this as: "Give me a basic Linux computer to work with"
FROM debian:bullseye

# Update the system and install the software we need
# apt-get update = "Check for latest software versions available"
# apt-get install = "Download and install these programs"
# -y = "Don't ask me yes/no questions, just do it automatically"
# nginx = "The web server that will serve our website"
# openssl = "Tool to create security certificates for HTTPS"
RUN apt-get update && apt-get install -y nginx openssl

# Create a folder to store our security certificates use -p to create parent folder if no exist 
RUN mkdir -p /etc/nginx/ssl

# Generate our own security certificate for HTTPS
# This is like creating an ID card that says "I am zmoumni.42.fr"
# openssl req = "Create a security certificate"
# -x509 = "Make it self-signed" (we act as our own authority)
# -nodes = "Don't put a password on it" (so nginx can use it automatically)
# -out = "Save the certificate (public part) here"
# -keyout = "Save the private key (secret part) here"
# -subj = "Put this information on the certificate"
# /CN=zmoumni.42.fr = "This certificate is for the website zmoumni.42.fr"
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=MA/ST=Beni Mellal-Khenifra/L=Khouribga/O=1337/OU=42Network/CN=zmoumni.42.fr"

# Copy our custom nginx configuration file into the container
# COPY = "Take this file from my computer and put it in the container"
# ./conf/nginx.conf = "The file on my computer" (next to the Dockerfile)
# /etc/nginx/sites-available/default = "Where nginx expects to find its config"
# Think of this as: "Replace nginx's default settings with our custom settings"
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

# Start nginx when the container runs
# CMD = "When someone starts this container, run this command"
# nginx = "Start the nginx web server"
# -g = "Give nginx a global setting"
# "daemon off;" = "Don't run in the background, stay in the front"
#
# Why "daemon off;" is CRITICAL:
# Normally nginx starts and then hides in the background
# But Docker needs the main program to stay visible in the front
# If nginx hides, Docker thinks "the program finished" and shuts down the container
# "daemon off;" tells nginx: "Stay visible so Docker knows you're still running"
#
# Think of it like this:
# Bad: nginx starts → hides in background → Docker thinks it died → container stops
# Good: nginx starts → stays visible → Docker knows it's alive → container keeps running
CMD ["nginx", "-g", "daemon off;"]