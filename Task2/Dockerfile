FROM ruby:3.0.0

RUN bundle config --global frozen 1
RUN mkdir -p /mental_health_coaching
WORKDIR /mental_health_coaching
COPY Gemfile /mental_health_coaching/Gemfile
COPY Gemfile.lock /mental_health_coaching/Gemfile.lock

RUN bundle install
