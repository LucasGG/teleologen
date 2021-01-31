FROM ruby:2.7

RUN gem update --system --no-document && \
    gem install bundler -v '2.2.7' --no-document && \
    gem install rubocop rubocop-performance --no-document
