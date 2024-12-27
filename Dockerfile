FROM ruby:3.4-alpine

LABEL org.opencontainers.image.authors='Wolf Software <containers@wolfsoftare.com>'
LABEL org.opencontainers.image.vendor='Wolf Software'
LABEL org.opencontainers.image.licenses='MIT'
LABEL org.opencontainers.image.title='Caretaker Container'
LABEL org.opencontainers.image.description='Caretkaer Container'
LABEL org.opencontainers.image.created="$(date --rfc-3339=seconds --utc)"
LABEL org.opencontainers.image.source='https://github.com/ActionsToolbox/caretaker-docker-image'
LABEL org.opencontainers.image.documentation='https://github.com/ActionsToolbox/caretaker-docker-image'

COPY Gemfile* /

RUN apk update && \
	apk add --no-cache \
		bash=5.1.16-r2 \
		build-base=0.5-r3 \
		git=2.36.2-r0 \
		gnupg=2.2.35-r4 \
		gpg-agent=2.2.35-r4 \
		&& \
	sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd && \
	gem install bundler -v '~> 2.3' && \
	bundle install --jobs=3 --retry=3 && \
	rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/bash"]
