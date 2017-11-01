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

COPY nginx-site.conf /env/nginx/sites-available/default

VOLUME ["/var/www/html"]
