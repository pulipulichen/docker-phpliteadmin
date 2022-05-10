FROM php:7.3.22-apache-stretch

RUN apt-get update && apt-get install -y wget curl unzip sqlite3 libsqlite3-dev
RUN docker-php-ext-install pdo_sqlite
RUN docker-php-ext-enable pdo_sqlite 

#WORKDIR /tmp
#RUN wget https://bitbucket.org/phpliteadmin/public/downloads/phpLiteAdmin_v1-9-8-2.zip
#RUN unzip phpLiteAdmin_v1-9-8-2.zip -d /var/www/html/
#RUN rm phpLiteAdmin_v1-9-8-2.zip

WORKDIR /var/www/html
COPY html/* /var/www/html/
RUN chmod +x -R *.php
RUN chown www-data:www-data -R *
RUN cp phpliteadmin.php index.php

RUN mkdir /db
RUN chmod -R 777 /db

# ENV LOCATION=/db
ENV PORT=80

COPY scripts /scripts
COPY scripts/database.sqlite /db-default/
RUN chmod -R 777 /db

CMD ["sh", "/scripts/init.sh"]
