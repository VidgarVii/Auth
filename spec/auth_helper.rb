# frozen_string_literal: true

require 'spec_helper'

ENV['APP_ENV'] = 'test'

require_relative '../config/environment'
require 'rack/test'

require 'rspec'
require 'test_prof/recipes/rspec/let_it_be'

module RSpecMixin
  include Rack::Test::Methods

  def app
    described_class
  end

  def response_body
    JSON.parse(last_response.body)
  end
end

RSpec.configure do |c|
  c.include RSpecMixin
end
