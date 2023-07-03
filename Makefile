.PHONY: setup-deploy composer npm db cache view-cache route-cache

SHELL := /bin/bash

composer:
	composer install

npm:
	npm install
	npm run production

db:
	php artisan migrate --force

cache:
	php artisan cache:clear
	php artisan config:cache

view-cache:
	php artisan view:cache

route-cache:
	php artisan route:cache

setup-deploy: composer npm db cache view-cache route-cache