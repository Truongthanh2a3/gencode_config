FROM truongthanh2a3/gencode-base:2.0

# Copy code Laravel
COPY ./source/VMS_GENCODE /var/www/html
COPY .env /var/www/html/.env

WORKDIR /var/www/html

# Cài Laravel dependencies
RUN composer install --no-interaction --prefer-dist --ignore-platform-reqs --optimize-autoloader
RUN composer require laravel/reverb --with-all-dependencies 
RUN docker-php-ext-install pcntl

# Laravel setup
RUN php artisan key:generate && \
    php artisan config:clear && \
    php artisan view:clear && \
    php artisan route:clear && \
    chown -R www-data:www-data /var/www/html && \
    php artisan reverb:install && \
    chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache 
        
EXPOSE 8009 8010 8014 8015

CMD bash -c "mkdir -p /run/php && \
    envsubst < /etc/nginx/tpl.d/gencode.tpl > /etc/nginx/conf.d/gencode.conf && \
    php artisan config:clear && \
    php artisan reverb:start & \
    php-fpm -D && \
    nginx -g 'daemon off;'"
