# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

Bundler.require

require 'pathname'
require 'sequel'
require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/i18n'

require_relative 'application'
require_relative 'auth_service'
require_relative 'initializers/sequel'


Dir[Application.root.join('app', '**', '*.rb')].sort.each { |f| require f }
