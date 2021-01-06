#!/bin/sh

# change to application root
cd /code

# run migration
pipenv run python manage.py migrate

# load fixtures
 pipenv run python manage.sh.py loaddata fixtures/data/*

# start gunicorn server
pipenv run gunicorn wsgi --bind 0.0.0.0:8000 --timeout 120