FROM nginx
COPY site.conf /etc/nginx/conf.d/default.conf
COPY index.php /code/
