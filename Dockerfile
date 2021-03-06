FROM ruby:3.0 AS development

RUN gem update --system --no-document && \
    gem install bundler -v '2.2.12' --no-document && \
    gem install rubocop rubocop-performance --no-document
