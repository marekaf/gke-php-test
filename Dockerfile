FROM nginx
COPY site.conf /etc/nginx/conf.d/site.conf
COPY index.php /code/

