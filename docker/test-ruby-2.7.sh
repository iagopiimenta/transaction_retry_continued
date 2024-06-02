#!/usr/bin/env bash

# fix conflicts between different ruby versions
rm -rf gemfiles/**/Gemfile.*.lock

gemfiles=(
  "gemfiles/activerecord-5.2/Gemfile.sqlite3"
  "gemfiles/activerecord-6.0/Gemfile.sqlite3"
  "gemfiles/activerecord-6.1/Gemfile.sqlite3"
  "gemfiles/activerecord-7.0/Gemfile.sqlite3"

  "gemfiles/activerecord-5.2/Gemfile.mysql2"
  "gemfiles/activerecord-6.0/Gemfile.mysql2"
  "gemfiles/activerecord-6.1/Gemfile.mysql2"
  "gemfiles/activerecord-7.0/Gemfile.mysql2"

  "gemfiles/activerecord-5.2/Gemfile.postgresql"
  "gemfiles/activerecord-6.0/Gemfile.postgresql"
  "gemfiles/activerecord-6.1/Gemfile.postgresql"
  "gemfiles/activerecord-7.0/Gemfile.postgresql"
)

for gemfile in "${gemfiles[@]}"; do
  database=$(echo $gemfile | cut -d'.' -f3)

  echo BUNDLE_GEMFILE=$gemfile db=$database bundle exec rake test
  BUNDLE_GEMFILE=$gemfile bundle install
  BUNDLE_GEMFILE=$gemfile db=$database bundle exec rake test
done
