# umtc-election-script

Switch user
```bash
su - larasail
```

## Deploy

Run this script
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jedymatt/umtc-election-script/main/deploy.sh)"
```

```bash
cd /var/www/laravel

larasail database init --user larasail --db umtc_election

php artisan optimize

php artisan migrate --seed --force
```

## Configuring crons

```bash
crontab -e
```
Then, append this line and save
```cron
* * * * * cd /var/www/laravel && php artisan schedule:run >> /dev/null 2>&1
```

## Upating 

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jedymatt/umtc-election-script/main/update.sh)"
```
