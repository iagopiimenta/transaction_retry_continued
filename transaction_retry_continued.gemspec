# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'transaction_retry/version'

Gem::Specification.new do |s|
  s.name        = 'transaction_retry_continued'
  s.version     = TransactionRetry::VERSION
  s.authors     = ['Iago Pimenta']
  s.homepage    = 'https://github.com/iagopiimenta/transaction_retry_continued'
  s.summary     = 'Retries database transaction on deadlock and transaction serialization errors. Supports MySQL, PostgreSQL and SQLite.'
  s.description = 'Retries database transaction on deadlock and transaction serialization errors. Supports MySQL, PostgreSQL and SQLite.'
  s.required_ruby_version = '>= 2.5'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'minitest', '5.3.4'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_runtime_dependency 'activerecord', '>= 5.2'
  s.add_runtime_dependency 'transaction_isolation_continued', '>= 1.0'
end
