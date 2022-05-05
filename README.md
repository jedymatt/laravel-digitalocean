# umtc-election-script

Switch user

```bash
su - larasail
```

## Deploy

Before running the scipt, run this to fix missing packages

```bash
sudo apt-get update --fix-missing
```

Then

php 8.0

```bash
curl -o- https://raw.githubusercontent.com/jedymatt/umtc-election-script/main/php80/deploy.sh | bash
```

php 8.1

```bash
curl -o- https://raw.githubusercontent.com/jedymatt/umtc-election-script/main/deploy.sh | bash
```

Setup database

```bash
cd /var/www/laravel

larasail database init --user larasail --db umtc_election

php artisan optimize

php artisan migrate --seed --force
```

supervisor

```bash
curl -o- https://raw.githubusercontent.com/jedymatt/umtc-election-script/main/supervisor.sh | bash
```

## Register cron for laravel scheduler

```bash
crontab -e
```

Then, append this line and save

```cron
* * * * * cd /var/www/laravel && php artisan schedule:run >> /dev/null 2>&1
```

## Updating from github repository

```bash
curl -o- https://raw.githubusercontent.com/jedymatt/umtc-election-script/main/update.sh | bash
```
