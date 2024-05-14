require 'fileutils'

module TransactionRetry
  module Test
    module Db

      def self.connect_to_mysql2
        ::ActiveRecord::Base.establish_connection(
          :adapter => "mysql2",
          :database => ENV['MYSQL_DB_NAME'],
          :host => ENV['MYSQL_DB_HOST'],
          :user => 'root',
          :password => ENV['MYSQL_DB_PASS']
        )
      end

      def self.connect_to_postgresql
        ::ActiveRecord::Base.establish_connection(
          :adapter => "postgresql",
          :database => ENV['POSTGRESQL_DB_NAME'],
          :host => ENV['POSTGRESQL_DB_HOST'],
          :user => ENV['POSTGRESQL_DB_USER'],
          :password => ENV['POSTGRESQL_DB_PASS']
        )
      end

      def self.connect_to_sqlite3
        ActiveRecord::Base.establish_connection(
          :adapter => "sqlite3",
          :database => ":memory:",
          :verbosity => "silent"
        )
      end

    end
  end
end
