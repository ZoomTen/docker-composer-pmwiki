FROM nginx:stable

RUN apt-get update && apt-get install -y \
      wget php php-mcrypt php-mysql php-fpm


ENV PMWIKI_VERSION 2.2.80

# The below commented-out lines are for running a Docker-side pmwiki
# and host-side site files.
# I currently have the site stored in git alongside pmwiki, so I don't (yet?)
# need Docker to handle that part.

# RUN wget -O /tmp/pmwiki-${PMWIKI_VERSION}.tgz http://www.pmwiki.org/pub/pmwiki/pmwiki-${PMWIKI_VERSION}.tgz && \
    # tar -xvzC /tmp/ -f /tmp/pmwiki-${PMWIKI_VERSION}.tgz && \
    # cp -r /tmp/pmwiki-${PMWIKI_VERSION}/* /var/www/html/ && \
    # mkdir /var/www/html/wiki.d/ &&  \
    # chmod 2777 /var/www/html/wiki.d/ 

# COPY index.php /var/www/html/

# VOLUME ["/var/www/html/wiki.d/","/var/www/html/local/","/var/www/html/cookbook/", "/var/www/html/pub", "/var/www/html/uploads"]

COPY nginx-site.conf /etc/nginx/conf.d/default.conf
RUN bash -c 'echo "daemon off;" >> /etc/nginx/nginx.conf' && \
    sed -ie 's/user  nginx;/user  www-data;/' /etc/nginx/nginx.conf

CMD /etc/init.d/php7.0-fpm start && /usr/sbin/nginx

VOLUME ["/var/www/html"]

# Command line:
# docker run -d -v $1:/var/www/html:rw -p 127.0.0.1:$2:80 edbrannin/docker-pmwiki
