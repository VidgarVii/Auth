# frozen_string_literal: true

class ApplicationContract < Dry::Validation::Contract
  config.messages.top_namespace = 'auth'
  config.messages.load_paths << Application.root.join('config/locales/errors.yml')
end
