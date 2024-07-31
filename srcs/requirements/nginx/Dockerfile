# FROM alpine:3.16
# RUN	apk update && apk upgrade && apk add --no-cache nginx
# EXPOSE 443
# CMD ["nginx", "-g", "daemon off;"]
FROM debian:bookworm
RUN apt update && apt install -y nginx
EXPOSE 443
COPY conf/nginx.conf /etc/nginx/sites-available/default
CMD ["nginx", "-g", "daemon off;"]