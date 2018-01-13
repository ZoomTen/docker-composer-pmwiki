FROM vutran/docker-nginx-php5-fpm

# Execute or run any additional instructions here such
# Example:
# COPY website.conf /etc/nginx/conf.d/website.conf
# ENV myEnvVar myEnvValue


RUN apt-get update && apt-get install -y \
      wget 


COPY nginx-site.conf /etc/nginx/conf.d/default.conf
RUN bash -c 'echo "daemon off;" >> /etc/nginx/nginx.conf' && \
    sed -ie 's/user  nginx;/user  www-data;/' /etc/nginx/nginx.conf

CMD /etc/init.d/php7.0-fpm start && /usr/sbin/nginx

VOLUME [ "/var/www/html", "/var/www/logs" ]

# Command line:
# docker run -d -v $1:/var/www/html:rw -p 127.0.0.1:$2:80 edbrannin/docker-pmwiki
