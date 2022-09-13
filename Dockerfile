FROM ruby:3.1.2

LABEL org.opencontainers.image.authors='Wolf Software <containers@wolfsoftare.com>'
LABEL org.opencontainers.image.vendor='Wolf Software'
LABEL org.opencontainers.image.licenses='MIT'
LABEL org.opencontainers.image.title='Caretaker Container'
LABEL org.opencontainers.image.description='Caretkaer Container'
LABEL org.opencontainers.image.created="$(date --rfc-3339=seconds --utc)"
LABEL org.opencontainers.image.source='https://github.com/ActionsToolbox/caretaker-docker-image'
LABEL org.opencontainers.image.documentation='https://github.com/ActionsToolbox/caretaker-docker-image'

COPY Gemfile* /

RUN gem install bundler -v '~> 2.3'  && bundle install --jobs=3 --retry=3
