#!/bin/bash

sudo apt-get update --fix-missing

sudo update-alternatives --set php /usr/bin/php8.0

cd /var/www/laravel

git init

git config --global --add safe.directory /var/www/laravel

git remote add origin https://github.com/jedymatt/umtc-election.git

git fetch

git checkout main --force

# setup for laravel queue

sudo apt-get install supervisor -y

sudo bash -c '
cat << EOF >/etc/supervisor/conf.d/laravel-worker.conf
[program:laravel-worker]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/laravel/artisan queue:work --sleep=3 --tries=3 --max-time=3600
autostart=true
autorestart=true
stopasgroup=true
killasgroup=true
user=larasail
numprocs=1
redirect_stderr=true
stdout_logfile=/var/www/laravel/storage/logs/worker.log
stopwaitsecs=3600
EOF'

sudo supervisorctl reread

sudo supervisorctl update

sudo supervisorctl start laravel-worker:*

# end of setup queue

sudo rm composer.lock
composer install --optimize-autoloader --no-dev

cp .env.production .env

npm install && npm run prod

php artisan key:generate --force
