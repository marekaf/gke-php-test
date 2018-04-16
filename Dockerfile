FROM nginx
COPY index.php /code/
COPY site.conf /etc/nginx/conf.d/default.conf
