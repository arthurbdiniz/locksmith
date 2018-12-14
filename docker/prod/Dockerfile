FROM ruby:2.5.3

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

RUN chmod +x script/start-prod.sh

EXPOSE  3000