[![Gem Version](https://badge.fury.io/rb/transaction_retry_continued.svg)](https://badge.fury.io/rb/transaction_retry_continued)
[![Maintainability](https://api.codeclimate.com/v1/badges/2a527711b8077f4be2a2/maintainability)](https://codeclimate.com/github/iagopiimenta/transaction_retry_continued/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2a527711b8077f4be2a2/test_coverage)](https://codeclimate.com/github/iagopiimenta/transaction_retry_continued/test_coverage)
[![CI PR Builds](https://github.com/iagopiimenta/transaction_retry_continued/actions/workflows/main.yml/badge.svg)](https://github.com/iagopiimenta/transaction_retry_continued/actions/workflows/main.yml)

# Transaction Retry Continued

> This is a community-driven continuation of the [`transaction_retry`](https://github.com/qertoip/transaction_retry) gem
for retrying database transactions on deadlock and serialization errors. Originally designed to support MySQL,
PostgreSQL, and SQLite databases.

The `transaction_retry` gem enhances transaction reliability by automatically retrying transactions upon encountering
deadlock and serialization errors in the database.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'transaction_retry_continued'
```

And then execute:

```bash
bundle install
```

## Usage

The gem simplifies transaction retry logic by automatically rescuing `ActiveRecord::TransactionIsolationConflict` and
retrying the transaction.

__It works out of the box with Ruby on Rails__.

If you have a standalone ActiveRecord-based project you'll need to call:

```ruby
TransactionRetry.apply_activerecord_patch     # after connecting to the database
```

## Database deadlock and serialization errors that are retried

#### MySQL

 * Deadlock found when trying to get lock
 * Lock wait timeout exceeded

#### PostgreSQL

 * deadlock detected
 * could not serialize access

#### SQLite

 * The database file is locked
 * A table in the database is locked
 * Database lock protocol error

## Configuration

You can optionally configure transaction_retry gem in your config/initializers/transaction_retry.rb (or anywhere else):

```ruby
  TransactionRetry.max_retries = 3
  TransactionRetry.wait_times = [0, 1, 2, 4, 8, 16, 32]   # seconds to sleep after retry n
```

## Features

 * Supports MySQL, PostgreSQL, and SQLite (as long as you are using new drivers mysql2, pg, sqlite3).
 * Exponential sleep times between retries (0, 1, 2, 4 seconds).
 * Logs every retry as a warning.
 * Intentionally does not retry nested transactions.
 * Configurable number of retries and sleep time between them.
 * Use it in your Rails application or a standalone ActiveRecord-based project.

## Testimonials

This gem was initially developed for and successfully works in production at [Kontomierz.pl](http://kontomierz.pl) - the finest Polish personal finance app.

## Compatibility

 * Ruby 2.5, 2.6, 2.7, 3.0, 3.1, 3.2, 3.3
 * ActiveRecord 5.2, 6.0, 6.1, 7.0

## Running tests

Run tests on the selected database (mysql2 by default):

```bash
# passing desired database, active record version and ruby version
docker compose run -e db=sqlite3 -e BUNDLE_GEMFILE=gemfiles/activerecord-7.0/Gemfile.sqlite3 ruby_2_5 bash -c ./docker/test-ruby.sh

# db options: mysql2, postgresql, sqlite3
# active record version options: 5.2, 6.0, 6.1, 7.0
# ruby version options: 2.5, 2.7, 3.0, 3.1
```

Run tests on all supported databases by ruby version:

```bash
docker compose up ruby_2_5
docker compose up ruby_2_7
docker compose up ruby_3_0
docker compose up ruby_3_1
```

Database configuration is hardcoded in test/db/db.rb; feel free to improve this and submit a pull request.

## How intrusive is this gem?

You should be very suspicious about any gem that monkey patches your stock Ruby on Rails framework.

This gem is carefully written to not be more intrusive than it needs to be:

- wraps ActiveRecord::Base#transaction class method using alias_method to add new behaviour
- introduces two new private class methods in ActiveRecord::Base (with names that should never collide)

## License

Released under the MIT license. Copyright (C) 2012 Piotr 'Qertoip' Włodarek.