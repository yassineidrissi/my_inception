# FROM alpine:3.16
# RUN	apk update && apk upgrade && apk add --no-cache nginx
# EXPOSE 443
# CMD ["nginx", "-g", "daemon off;"]
FROM debian:bookworm
RUN apt update && apt install -y nginx
RUN apt install openssl -y
EXPOSE 443
# RUN service nginx start
COPY conf/nginx.conf /etc/nginx/sites-available/default
COPY tools/yaidriss.42.fr.crt /etc/nginx/ssl/
COPY tools/yaidriss.42.fr.key /etc/nginx/ssl/
CMD ["nginx", "-g", "daemon off;"]