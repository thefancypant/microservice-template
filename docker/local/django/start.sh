#!/bin/sh

#install dependencies


# setup postgres container
while ! nc -z template-postgres-local 5432; do
    echo "postgres is being deployed...." && sleep 10
done
echo "postgres is up" && sleep 10

# change to application root
cd /code/application

# make migration
# pipenv run python manage.sh.py makemigrations

# run migration
pipenv run python manage.py migrate

# load fixtures
# pipenv run python manage.sh.py loaddata fixtures/data/*

# start dev server
pipenv run python manage.py runserver 0.0.0.0:800