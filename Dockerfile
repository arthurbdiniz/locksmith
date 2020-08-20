FROM ruby:2.5.3

ENV RAILS_ENV development

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client build-essential

RUN mkdir /locksmith
WORKDIR /locksmith

COPY Gemfile /locksmith/Gemfile
COPY Gemfile.lock /locksmith/Gemfile.lock

RUN bundle install

COPY . /locksmith

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE  3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]