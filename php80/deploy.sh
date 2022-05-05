#!/bin/bash

sudo apt-get update --fix-missing

sudo update-alternatives --set php /usr/bin/php8.0

cd /var/www/laravel

git init

git config --global --add safe.directory /var/www/laravel

git remote add origin https://github.com/jedymatt/umtc-election.git

git fetch

git checkout main --force

composer install --optimize-autoloader --no-dev

cp .env.production .env

php artisan key:generate --force

npm install && npm run prod
