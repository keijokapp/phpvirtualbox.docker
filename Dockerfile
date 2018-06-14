FROM richarvey/nginx-php-fpm
MAINTAINER Keijo Kapp <keijo.kapp@gmail.com>

RUN curl https://codeload.github.com/phpvirtualbox/phpvirtualbox/tar.gz/5.2-0 -o phpvirtualbox-5.2-0.tar.gz && \
	tar -xzf phpvirtualbox-5.2-0.tar.gz && \
	mv phpvirtualbox-5.2-0 /var/www

ADD config.php /var/www/phpvirtualbox-5.2-0

ADD phpvirtualbox.nginx.conf /etc/nginx/sites-available/phpvirtualbox
RUN ln -s /etc/nginx/sites-available/phpvirtualbox /etc/nginx/sites-enabled/phpvirtualbox
RUN rm /etc/nginx/sites-enabled/default.conf

WORKDIR /var/www/phpvirtualbox-5.2-0
EXPOSE 80
