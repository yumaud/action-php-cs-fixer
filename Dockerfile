FROM php:8.1-alpine

ENV REVIEWDOG_VERSION=v0.14.1

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3006
RUN apk --no-cache add git python3 && python3 --version

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

# TODO: Install a linter and/or change docker image as you need.
RUN wget -O - -q https://git.io/misspell | sh -s -- -b /usr/local/bin/
RUN wget -q https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer
RUN chmod a+x php-cs-fixer && php-cs-fixer /usr/local/bin/php-cs-fixer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
