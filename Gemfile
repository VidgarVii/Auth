# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'i18n'                 # Internationalization and localization
gem 'puma'
gem 'rake'
gem 'require_all'          # Auto load constants
gem 'sequel_secure_password'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-i18n', '~> 0.1.0'

gem 'config'               # Setting application

# DB
gem 'pg'
gem 'sequel'               # ORM
gem 'tux'                  # Sinatra console

gem 'dry-validation'       # Provided pattern Contact
gem 'interactor', '~> 3.0' # Provided pattern Interactor

group :development do
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  gem 'seedbank', require: false # Generate seed data
end

group :test do
  gem 'database_cleaner-sequel'
  gem 'rack-test'
  gem 'rspec'              # Test
  gem 'test-prof'          # Provided simple methods for init objects
end
