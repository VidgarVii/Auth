# frozen_string_literal: true

require './config/environment'

run Rack::URLMap.new(
  'v1/signup' => UserRoutes,
  'v1/login' => UserSessionRoutes,
  'v1/auth' => AuthRoutes
)
