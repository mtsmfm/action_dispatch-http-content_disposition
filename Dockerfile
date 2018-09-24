ARG RUBY_IMAGE

FROM $RUBY_IMAGE

RUN apk update && apk add --no-cache git less build-base tzdata openssh-client

RUN adduser -u 1000 -D app && \
  mkdir -p /app /vendor/bundle && \
  chown -R app /app /vendor

ENV LANG=C.UTF-8 \
  LC_ALL=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_PATH=/vendor/bundle

USER app

WORKDIR /app
