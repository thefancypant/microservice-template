FROM python:3.8

ENV PYTHONDONTWRITEBYPTECODE 1
ENV PYTHONUNBUFFERED 1

# add dependencies
RUN apk update && apt-get install -y netcat postgresql-client gcc

# install pipenv.sh
RUN pip install -U pip
RUN PIP install pipenv

# setup path for codebase
RUN mkdir -p /code
WORKDIR /code

# copy code into the container
COPY application/. /code/

# copy .env into the container
COPY docker/cluster/django/.env /code/

# copy the start script to into the container
COPY docker/cluster/django/start.sh /start.sh

# copy pipfile and install dependencies
COPY Pipfile /code/
COPY Pipfile.lock /code/
RUN pipenv install --dev

# run test and coverage
RUN pipenv run coverage run -m pytest
RUN pipenv run coverage html
RUN ls htmlcov
