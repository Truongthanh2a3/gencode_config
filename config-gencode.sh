#!/bin/bash

echo "Pull commit"
cd /home/max/gencode/devops_docker_gencode/source/VMS_GENCODE
git checkout develop
git pull origin develop

cd /home/max/gencode/devops_docker_gencode
echo "🧼 Removing old container (if exists)..."
docker compose rm -sf nginx-php-fpm-8.2

echo "🚧 Rebuilding nginx-php-fpm-8.2 without cache..."
docker compose build --no-cache nginx-php-fpm-8.2

echo "🚀 Recreating container..."
docker compose up -d --no-deps --force-recreate nginx-php-fpm-8.2

echo "✅ Done!"

echo " Running Lavarel setup inside container: nginx-php-fpm-82"

# docker compose exec -i nginx-php-fpm-8.2 bash -c "
#      cd /var/www/html && \ 
#      php artisan migrate:fresh --seed
#      "
docker compose exec -i nginx-php-fpm-8.2 bash -c "
    php artisan config:clear && \
    php artisan route:clear && \
    php artisan view:clear && \
    php artisan config:cache && \
    npm install && npm run build && \
    composer require laravel/reverb maatwebsite/excel phpoffice/phpspreadsheet:^1.28 --with-all-dependencies
    "
echo " Lavarel setup completed!"
    
