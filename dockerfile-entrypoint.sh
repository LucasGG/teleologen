#!/usr/bin/env sh
set -e

bundle check || bundle install --jobs 4 --retry 3

$@
