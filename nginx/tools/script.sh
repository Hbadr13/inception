mkdir -p /etc/nginx/ssl
openssl req -x509 -newkey rsa:4096 -subj /C=FR -nodes -keyout /etc/nginx/ssl/wordpress.key -out /etc/nginx/ssl/wordpress.crt
nginx -g "daemon off;"