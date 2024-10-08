# etabs | QR SaaS | Stripe | POS

[![QR](	https://loom.business/impactfront/img/flayer.png)](https://loom.business/)
[![FT](https://loom.business/uploads/settings/795fc9c0-6e1e-4de4-9fd0-5daa4aa23ed4_logo.jpg)](https://loom.business/home)
[![WP](https://loom.business/impactfront/img/qrdemo.jpg)](https://loom.business/tables)


## Test
php artisan test --testsuite=Feature

## License

The Laravel framework is open-source software licensed under the [MIT license](https://opensource.org/licenses/MIT).

## ENV
SHOW_DEMO_CREDENTIALS=true
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=laravel


MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=
MAIL_FROM_ADDRESS='test@example.com'
MAIL_FROM_NAME='App Demo'

## Updates

COMPOSER_MEMORY_LIMIT=-1 composer require */**

## Clearing cache
php artisan cache:clear
ddcache
php artisan config:cache
php artisan config:clear
php artisan route:clear
php artisan config:cache
php artisan route:cache
php artisan optimize


## Sync missing keys
php artisan translation:sync-missing-translation-keys


## Default .env
[.env](https://paste.laravel.io/2fe670c7-f66b-443e-9e79-b5fa6618360b)


$ docker network inspect sail

$ docker network connect sail loom-laravel.test-1

$ docker network connect sail loom-mailhog-1

$ docker network connect sail loom-mysql-1

$ docker network connect sail loom-redis-1

$ docker network inspect sail

$ docker compose up -d