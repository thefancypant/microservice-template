FROM python:3.8-alpine

ENV PYTHONDONTWRITEBYPTECODE 1
ENV PYTHONUNBUFFERED 1

# add dependencies
RUN apk update
RUN apk add netcat-openbsd python3-dev gcc musl-dev postgresql-dev postgresql-client

# install pipenv.sh
RUN pip install -U pip
RUN pip install pipenv

# setup path for codebase
RUN mkdir -p /code
WORKDIR /code

# copy pipfile and install dependencies
COPY Pipfile /code/
COPY Pipfile.lock /code/
RUN pipenv install --dev

