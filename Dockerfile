FROM mostad/composer

ADD / /application
RUN composer install --no-ansi --no-dev --no-interaction --no-progress --no-scripts --optimize-autoloader

VOLUME ["/application"]
