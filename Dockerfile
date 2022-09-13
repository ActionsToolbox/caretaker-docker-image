FROM ruby:3.1.2

COPY Gemfile* ./
RUN gem install bundler && bundle install --jobs=3 --retry=3
