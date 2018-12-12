FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    mysql-client

RUN mkdir /locksmith

WORKDIR /locksmith

COPY locksmith/Gemfile /locksmith/Gemfile
COPY locksmith/Gemfile.lock /locksmith/Gemfile.lock
RUN bundle install

COPY . /locksmith

RUN chmod +x locksmith/start-dev.sh

EXPOSE  3000
