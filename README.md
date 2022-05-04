# umtc-election-script

Switch user
```bash
su - larasail
```

Run this script

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jedymatt/umtc-election-script/main/deploy.sh)"
```

```bash

larasail database init --user larasail --db umtc_election

php artisan migrate --seed

php artisan optimize
```
