FROM debian:bookworm
RUN apt update && apt install -y mariadb-server


EXPOSE 3306/tcp

COPY ./conf/create_db.sh .
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x create_db.sh
CMD ["bash", "create_db.sh"]

