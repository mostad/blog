FROM php:7.0-fpm

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y zlib1g-dev git && \
    rm -r /var/lib/apt/lists/*
RUN docker-php-ext-install pdo pdo_mysql zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

USER www-data

# Install composer dependencies
COPY composer.json /tmp/composer.json
COPY composer.lock /tmp/composer.lock
RUN cd /tmp && \
    composer install --no-ansi --no-dev --no-interaction --no-progress --no-scripts --optimize-autoloader
RUN mkdir -p /var/www/html && \
    cp -a /tmp/vendor /var/www/html/

COPY . /var/www/html
RUN chown -R www-data:www-data /var/www/html

VOLUME ["/var/www/html"]
