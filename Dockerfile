FROM ruby:3.0 AS development

RUN gem update --system --no-document

ENTRYPOINT ["dockerfile-entrypoint.sh"]
