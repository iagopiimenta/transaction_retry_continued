FROM ruby:3.0-slim

RUN apt-get update &&\
    apt-get install -y build-essential git sqlite3 libsqlite3-dev mariadb-client libmariadb-dev postgresql-client libpq-dev &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*
