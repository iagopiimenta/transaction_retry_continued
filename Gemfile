# frozen_string_literal: true

source "http://rubygems.org"

gemspec

gemfile_local = File.expand_path '../Gemfile.local', __FILE__
eval File.read(gemfile_local), binding, gemfile_local if File.exist? gemfile_local
#
# group :test do
#   gem 'transaction_isolation', git: 'https://github.com/alittlebit/transaction_isolation'
#   # Use the gem instead of a dated version bundled with Ruby
#   gem 'minitest', '5.3.4'
#   gem 'simplecov', :require => false
# end
#
# group :development do
#   gem 'transaction_isolation', git: 'https://github.com/alittlebit/transaction_isolation'
#   gem 'rake'
#   # enhance irb
#   gem 'awesome_print', :require => false
#   gem 'pry', :require => false
# end
