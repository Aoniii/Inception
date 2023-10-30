FROM debian:buster

EXPOSE 443

RUN apt-get update -y
RUN apt-get install nginx openssl -y

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/snourry.crt -keyout /etc/ssl/snourry.key \
	-subj "/C=FR/ST=France/L=Angouleme/O=42 Angouleme/OU=snourry/CN=snourry.42.fr"

COPY ./conf/default /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]
