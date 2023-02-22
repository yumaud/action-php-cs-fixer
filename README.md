# action-php-cs-fixer

<!-- TODO: replace reviewdog/action-template with your repo name -->
[![Test](https://github.com/yumaud/action-php-cs-fixer/workflows/Test/badge.svg)](https://github.com/yumaud/action-php-cs-fixer/actions?query=workflow%3ATest)
[![reviewdog](https://github.com/yumaud/action-php-cs-fixer/workflows/reviewdog/badge.svg)](https://github.com/yumaud/action-php-cs-fixer/actions?query=workflow%3Areviewdog)
[![depup](https://github.com/yumaud/action-php-cs-fixer/workflows/depup/badge.svg)](https://github.com/yumaud/action-php-cs-fixer/actions?query=workflow%3Adepup)
[![release](https://github.com/yumaud/action-php-cs-fixer/workflows/release/badge.svg)](https://github.com/yumaud/action-php-cs-fixer/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/yumaud/action-php-cs-fixer?logo=github&sort=semver)](https://github.com/yumaud/action-php-cs-fixer/releases)
[![action-bumpr supported](https://img.shields.io/badge/bumpr-supported-ff69b4?logo=github&link=https://github.com/haya14busa/action-bumpr)](https://github.com/haya14busa/action-bumpr)

This Github Action runs php-cs-fixer format check with reviewdog.

Does not run fix format only check format. 

## Input

```yaml
inputs:
  github_token:
    description: 'GITHUB_TOKEN'
    default: '${{ github.token }}'
  workdir:
    description: 'Working directory relative to the root directory.'
    default: '.'
  ### Flags for reviewdog ###
  level:
    description: 'Report level for reviewdog [info,warning,error]'
    default: 'error'
  reporter:
    description: 'Reporter of reviewdog command [github-pr-check,github-check,github-pr-review].'
    default: 'github-pr-check'
  filter_mode:
    description: |
      Filtering mode for the reviewdog command [added,diff_context,file,nofilter].
      Default is added.
    default: 'added'
  fail_on_error:
    description: |
      Exit code for reviewdog when errors are found [true,false]
      Default is `false`.
    default: 'false'
  reviewdog_flags:
    description: 'Additional reviewdog flags'
    default: ''
  ### Option for php-cs-fixer ###
  path:
    description: 'The path to target files (Allow multifile)'
    default: '.'
  config:
    description: 'The path to a config file'
```

## Usage
<!-- TODO: update. replace `template` with the linter name -->

```yaml
name: php-cs-fixer-check
on: [pull_request]
jobs:
  # TODO: change `linter_name`.
  linter_name:
    name: runner / php-cs-fixer-check
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: yumaud/action-template@master
        with:
          github_token: ${{ secrets.github_token }}
          # Check format path
          # The paths separate space if you want to check multifile
          # You can use tj-actions/changed-files to you want to check only committed files
          path: ./Dog.php ./Cat.php
```
