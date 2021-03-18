FROM ruby:2.7.2

RUN apt-get update -qq && \
  apt-get install -y \
  build-essential \
  libpq-dev \
  # Make "rails dbconsole" command available with psql
  postgresql-client \
  nodejs

RUN mkdir /app

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

ADD . /app