#!/usr/bin/env bash

echo "Waiting on mysql"
sleep 20 # wait for mysql to start

# bundle exec rake db:reset
bundle exec rake --verbose db:create
bundle exec rake db:migrate

echo $ROOM > rooms.csv

echo "Exporting all rooms metadata into db"
bundle exec thor task:room:export --force

bundle exec thor task:history:export --force --threads=10

bundle exec thor task:history:save --force

bundle exec thor task:message:export --force
# sleep 1200
