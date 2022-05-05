#!bin/bash

sudo apt-get install -y supervisor

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
