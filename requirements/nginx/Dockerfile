FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y openssl nginx


RUN openssl req -x509 -nodes  -keyout /etc/ssl/hbadr.42.fr.key -out /etc/ssl/hbadr.42.fr.crt -subj "/C=MA/L=KH/emailAddress=admin@example.com"
# req generate a CSR or a self-signed certificate
# -x509 create a self-signed certificate
# -nodes: created without a password,
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
