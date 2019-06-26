FROM python:3-alpine

RUN apk add --update gcc postgresql-client postgresql-dev linux-headers musl-dev

ENV PYTHONUNBUFFERED 1

RUN mkdir /app

WORKDIR /app
COPY . /app/.

RUN pip install -r requirements.txt
RUN python manage.py migrate
