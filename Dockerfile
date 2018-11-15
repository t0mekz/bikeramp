FROM ruby:2.5.3

ENV APP_ROOT /app

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev cmake

WORKDIR $APP_ROOT

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . $APP_ROOT
