# frozen_string_literal: true

require './config/environment'

map '/auth' do
  run AuthRoutes
end
