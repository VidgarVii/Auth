# frozen_string_literal: true

require './config/environment'
require_relative 'config/initializers/consumer'

run Rack::URLMap.new(
  '/v1/signup' => UserRoutes,
  '/v1/login' => UserSessionRoutes
)
