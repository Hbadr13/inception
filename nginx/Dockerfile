FROM debian:buster
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

COPY conf/default.conf /etc/nginx/sites-available/default
COPY tools/script.sh /tmp
RUN chmod +x /tmp/script.sh
CMD ["bash", "/tmp/script.sh"]
