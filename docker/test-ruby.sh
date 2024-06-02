#!/usr/bin/env bash

# fix conflicts between different ruby versions
rm -rf gemfiles/**/Gemfile.*.lock

echo BUNDLE_GEMFILE=$BUNDLE_GEMFILE db=$db bundle exec rake test
     BUNDLE_GEMFILE=$BUNDLE_GEMFILE bundle install
     BUNDLE_GEMFILE=$BUNDLE_GEMFILE db=$db bundle exec rake test
