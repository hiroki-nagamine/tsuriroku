FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN mkdir /app

RUN gem install bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
