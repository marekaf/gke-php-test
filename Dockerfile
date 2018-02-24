FROM nginx
COPY site.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /code/
COPY index.php /code/
