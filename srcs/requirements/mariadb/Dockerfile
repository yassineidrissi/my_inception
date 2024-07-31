FROM debian:bookworm
RUN apt update && apt install -y mariadb-server

# COPY ./conf/my.cnf /etc/mysql/my.d

EXPOSE 3306/tcp

COPY ./conf/create_db.sh .

RUN chmod +x create_db.sh
CMD ["bash", "create_db.sh"]

