#!/bin/bash
set -e

rm -f /app/tmp/pids/server.pid

bundle check || bundle install --path=.bundle
yarn check || yarn install

exec "$@"
