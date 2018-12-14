FROM ruby:2.5.3

ENV RAILS_ENV development

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    mysql-client

RUN mkdir /locksmith

WORKDIR /locksmith

COPY Gemfile /locksmith/Gemfile
COPY Gemfile.lock /locksmith/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . /locksmith

RUN chmod +x start-dev.sh

EXPOSE  3000
