- config-gencode.sh:
    ADD composer require laravel/reverb maatwebsite/excel phpoffice/phpspreadsheet:^1.28 --with-all-dependencies

- composer.json:
    ADD "phpoffice/phpspreadsheet": "^1.28",
    ADD "maennchen/zipstream-php": "^2.1"
- composer.lock: 
    DELETE
- /nginx-php-fpm-82/dockerfile:
    ADD RUN docker-php-ext-install pcntl
- docker-compose.yml:
    ADD port 8080:8080
    ADD /etc/letsencrypt:/etc/letsencrypt:ro