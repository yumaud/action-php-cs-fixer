#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ] ; then
  cd "${GITHUB_WORKSPACE}/${INPUT_WORKDIR}" || exit
  git config --global --add safe.directory "${GITHUB_WORKSPACE}" || exit 1
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

php-cs-fixer --version

(php-cs-fixer fix "${INPUT_PATH}" \
      --config="${INPUT_CONFIG}" \
      --diff \
      --dry-run || true) \
  | python3 /usr/local/bin/parse.py \
  | reviewdog -name="php-cs-fixer" \
      -f=diff \
      -reporter="${INPUT_REPORTER:-github-pr-review}" \
      -filter-mode="${INPUT_FILTER_MODE}" \
      -fail-on-error="${INPUT_FAIL_ON_ERROR}" \
      -level="${INPUT_LEVEL}" \
      "${INPUT_REVIEWDOG_FLAGS}" \
  || exit 1
