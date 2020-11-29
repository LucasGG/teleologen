FROM ruby:2.7

RUN gem update --system && gem install bundler
