FROM debian:buster

ARG NAME
ARG USER
ARG PASSWORD

EXPOSE 3306

RUN apt update -y
RUN apt install -y mariadb-server

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld
RUN service mysql start && mysql -e "CREATE DATABASE IF NOT EXISTS ${NAME};" \
&& mysql -e "GRANT ALL PRIVILEGES ON ${NAME}.* TO '${USER}'@'%' IDENTIFIED BY '${PASSWORD}';" \
&& mysql -e "SET PASSWORD FOR '${USER}'@'%'=PASSWORD('${PASSWORD}');" \
&& mysql -e "FLUSH PRIVILEGES;"

ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0"]
