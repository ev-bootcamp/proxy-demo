FROM nginx

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./cert/localhost.crt /etc/ssl/certs/localhost.crt
COPY ./cert/localhost.key /etc/ssl/private/localhost.key

EXPOSE 443
