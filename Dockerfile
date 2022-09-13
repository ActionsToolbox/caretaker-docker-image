FROM ruby:3.1.2

ENV PATH=/usr/local/bundle/bin/:$PATH

RUN gem install caretaker
