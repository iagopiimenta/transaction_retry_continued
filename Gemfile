# frozen_string_literal: true

source 'http://rubygems.org'

gemspec

gemfile_local = File.expand_path 'Gemfile.local', __dir__
eval File.read(gemfile_local), binding, gemfile_local if File.exist? gemfile_local

gem 'rubocop', '~> 1.64'
