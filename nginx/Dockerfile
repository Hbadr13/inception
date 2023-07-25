FROM debian:buster
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx wget -y
RUN mkdir  /etc/nginx/ssl -p
COPY conf/nginx.conf /etc/nginx/sites-available/default
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
        -keyout /etc/nginx/ssl/inception.key \
        -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=hbadr.42.fr/UID=hbadr"
        
CMD ["nginx" ,"-g", "daemon off;"]
