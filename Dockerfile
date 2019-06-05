FROM python:3.6.8-alpine
MAINTAINER Jaehong Park

ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app

RUN pip install pipenv
ADD Pipfile Pipfile.lock /app/
RUN pipenv install --system --deploy

COPY ./app /app

# Security purpose
RUN adduser -D user
USER user