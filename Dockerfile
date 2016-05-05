FROM mostad/composer

# Install composer dependencies
COPY composer.json /tmp/composer.json
COPY composer.lock /tmp/composer.lock
RUN cd /tmp && composer install --no-ansi --no-dev --no-interaction --no-progress --no-scripts --optimize-autoloader
RUN cp -a /tmp/vendor /application/

COPY . /application

VOLUME ["/application"]
