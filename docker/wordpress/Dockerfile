# Dockerfile: php:7.2.16-apache
# URL: https://github.com/docker-library/php/blob/873725e57ec2fc5f2642dc0023676597bcc4bea9/7.2/stretch/apache/Dockerfile
FROM php:7.2.16-apache

ENV WORDPRESS_VERSION 5.1.1
ENV WORDPRESS_WORKDIR /var/www/html
ENV DOWNLOAD_WP_URL 'https://gist.githubusercontent.com/isusalec/2d98d147ee77e93067462ad3d0d6a20f/raw/e99a018536c8841f43322b01dfefd7cbc4b8ceeb/download-wp.sh'
ENV DOWNLOAD_WP_PATH '/tmp/download-wp.sh'

# Instala as extensões PHP necessárias.
RUN set -ex; \
	savedAptMark="$(apt-mark showmanual)"; \
	apt-get update; \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends libjpeg-dev libpng-dev; \
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd mysqli opcache zip; \
	\
# Redefini a lista "manual" do apt-mark para que "purge --auto-remove" remova todas as dependências de compilação
	apt-mark auto '.*' > /dev/null; \
	apt-mark manual $savedAptMark; \
	ldd "$(php -r 'echo ini_get("extension_dir");')"/*.so \
		| awk '/=>/ { print $3 }' \
		| sort -u \
		| xargs -r dpkg-query -S \
		| cut -d: -f1 \
		| sort -u \
		| xargs -rt apt-mark manual; \
	\
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
	rm -rf /var/lib/apt/lists/*

ADD $DOWNLOAD_WP_URL $DOWNLOAD_WP_PATH
RUN chmod +x $DOWNLOAD_WP_PATH

RUN a2enmod rewrite expires

WORKDIR $WORDPRESS_WORKDIR

CMD $DOWNLOAD_WP_PATH $WORDPRESS_VERSION $WORDPRESS_WORKDIR && apache2-foreground
