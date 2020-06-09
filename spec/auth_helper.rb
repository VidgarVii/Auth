# frozen_string_literal: true

require 'spec_helper'

ENV['APP_ENV'] = 'test'

require_relative '../config/environment'
require 'rack/test'

require 'rspec'
require 'test_prof/recipes/rspec/let_it_be'
require 'database_cleaner/sequel'

Dir[Application.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include RouteHelper, type: :routes
end
