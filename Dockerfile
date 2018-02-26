FROM phusion/baseimage:latest

#Diskover-web
RUN apt-get update
RUN apt-get install -y git php curl php-curl supervisor
RUN curl -s https://getcomposer.org/installer | php; mv ./composer.phar /usr/local/bin/composer
RUN mkdir /opt/diskover-web 
RUN git clone https://github.com/shirosaidev/diskover-web.git /opt/diskover-web
RUN cd /opt/diskover-web; /usr/local/bin/composer install
RUN ln -s /opt/diskover-web/public/dashboard.php /opt/diskover-web/public/index.php
RUN chmod 775 -R /opt/diskover-web
WORKDIR /opt/diskover-web

#supervisord
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD boot.sh /usr/bin/boot.sh

EXPOSE 8081
CMD ["/usr/bin/boot.sh"]
