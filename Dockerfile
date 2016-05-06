FROM mostad/composer

ENV COMPOSER_ALLOW_SUPERUSER 1

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
